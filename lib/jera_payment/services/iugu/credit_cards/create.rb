module JeraPayment
  module Services
    module Iugu
      module CreditCards
        class Create < JeraPayment::Services::Iugu::Base
          def initialize(resource)
            super
          end

          def call
            credit_card_token = create_credit_card_token

            add_error(credit_card_token[:errors]) and return false if credit_card_token[:errors].present?

            set_payment_token_attributes(credit_card_token)

            link_credit_card_response = link_credit_card(credit_card_token[:id])

            add_error(link_credit_card_response[:errors]) and return false if link_credit_card_response[:errors].present?

            @resource.api_id = link_credit_card_response[:id]
          end

          private
          def create_credit_card_token
            eval("JeraPayment::Api::Iugu::PaymentToken.create(JeraPayment::Parsers::Iugu::CreditCardParser.parse_payment_token(@resource),
                                                              @resource.customer&.sub_account&.api_token)")
          end

          def set_payment_token_attributes(credit_card_token)
            @resource.assign_attributes(brand: credit_card_token[:extra_info][:brand], number: credit_card_token[:extra_info][:display_number])
          end

          def link_credit_card(credit_card_token_id)
            eval("JeraPayment::Api::Iugu::PaymentMethod.create(@resource.customer.api_id,
                                                              JeraPayment::Parsers::Iugu::CreditCardParser.parse_payment_method(@resource, credit_card_token_id),
                                                              @resource.customer&.sub_account&.api_token)")
          end

        end
      end
    end
  end
end
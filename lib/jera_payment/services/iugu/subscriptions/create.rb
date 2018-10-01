module JeraPayment
  module Services
    module Iugu
      module Subscriptions
        class Create < JeraPayment::Services::Iugu::Base
          def initialize(resource)
            super
          end

          def call
            iugu_subscription = eval("JeraPayment::Api::Iugu::Subscription.create(@attributes.merge({customer_id: @resource.customer.api_id}),
                                                                                  @resource&.customer&.sub_account&.api_token)")

            if iugu_subscription[:errors].present?
              add_error(iugu_subscription[:errors])
            else
              set_api_attributes(iugu_subscription)
            end

            @resource.errors.blank?
          end

          private
          def set_api_attributes(attributes)
            @resource.assign_attributes(api_id: attributes[:id], active: attributes[:active],
                                        suspended: attributes[:suspended], credits: attributes[:credits],
                                        price_cents: attributes[:price_cents])
          end
        end
      end
    end
  end
end
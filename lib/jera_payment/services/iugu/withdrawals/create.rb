module JeraPayment
  module Services
    module Iugu
      module Withdrawals
        class Create < JeraPayment::Services::Iugu::Base
          def initialize(resource)
            super
          end

          def call
            iugu_withdrawal = eval("JeraPayment::Api::Iugu::SubAccount.request_withdrawal(@resource&.sub_account&.account_id, @attributes,
                                                                  @resource&.sub_account&.api_token)")

            if iugu_withdrawal[:errors].present?
              add_error(iugu_withdrawal[:errors])
            else
              set_api_attributes(iugu_withdrawal)
            end

            @resource.errors.blank?
          end

          private
          def set_api_attributes(attributes)
            @resource.api_id = attributes[:id]
          end
        end
      end
    end
  end
end
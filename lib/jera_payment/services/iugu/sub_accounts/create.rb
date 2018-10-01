module JeraPayment
  module Services
    module Iugu
      module SubAccounts
        class Create < JeraPayment::Services::Iugu::Base
          def initialize(resource)
            super
          end

          def call
            iugu_marketplace = JeraPayment::Api::Iugu::SubAccount.create(@attributes)

            if iugu_marketplace[:errors].present?
              add_error(iugu_marketplace[:errors])
            else
              set_api_attributes(iugu_marketplace)
            end

            @resource.errors.blank?
          end

          private
          def set_api_attributes(attributes)
            @resource.assign_attributes(attributes.slice(:account_id, :live_api_token, :test_api_token, :user_token, :name))
          end
        end
      end
    end
  end
end
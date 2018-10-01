module JeraPayment
  module Services
    module Iugu
      module SubAccounts
        class Update < JeraPayment::Services::Iugu::Base
          def initialize(resource)
            super
          end

          def call
            iugu_marketplace = eval("JeraPayment::Api::Iugu::SubAccount.update(@resource.account_id, @attributes, @resource.#{api_token})")

            add_error(iugu_marketplace[:errors]) if iugu_marketplace[:errors].present?

            @resource.errors.blank?
          end
          
        end
      end
    end
  end
end
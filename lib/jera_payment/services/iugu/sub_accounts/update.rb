module JeraPayment
  module Services
    module Iugu
      module SubAccounts
        class Update < JeraPayment::Services::Iugu::Base
          def call
            iugu_marketplace = JeraPayment::Api::Iugu::SubAccount.update(JeraPayment::Parsers::Iugu::SubAccountParser.parse_account_configuration(@resource),
                                                                         @resource.user_token)

            add_error(iugu_marketplace[:errors]) if iugu_marketplace[:errors].present?

            @resource.errors.blank?
          end

        end
      end
    end
  end
end
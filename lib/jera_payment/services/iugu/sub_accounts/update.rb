module JeraPayment
  module Services
    module Iugu
      module SubAccounts
        class Update < JeraPayment::Services::Iugu::Base
          def call
            @attributes = @attributes.except('account_id', 'live_api_token',
                                             'test_api_token', 'user_token',
                                             'current_household_id', 'sub_accountable_type',
                                             'sub_accountable_id', 'resp_name', 'resp_cpf', 'can_receive?',
                                             'is_verified?', 'last_verification_request_feedback', 'id',
                                             'created_at', 'updated_at', 'name')

            iugu_marketplace = JeraPayment::Api::Iugu::SubAccount.update(@attributes, @resource.user_token)

            add_error(iugu_marketplace[:errors]) if iugu_marketplace[:errors].present?

            @resource.errors.blank?
          end

        end
      end
    end
  end
end


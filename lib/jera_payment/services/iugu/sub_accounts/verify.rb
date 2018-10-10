module JeraPayment
  module Services
    module Iugu
      module SubAccounts
        class Verify < JeraPayment::Services::Iugu::Base
          def initialize(resource, attributes)
            @resource = resource
            @attributes = attributes
          end

          def call
            iugu_marketplace = JeraPayment::Api::Iugu::SubAccount.verify(@resource.account_id, @attributes, @resource.user_token)

            add_error(iugu_marketplace[:errors]) and return @resource if iugu_marketplace[:errors].present?

            set_api_attributes(iugu_marketplace)

            @resource
          end

          private
          def set_api_attributes(attributes)
            @resource.assign_attributes(attributes.slice(:account_id, :live_api_token, :test_api_token, :user_token, :name)
                                                         .merge({resp_cpf: @attributes[:data][:resp_cpf], resp_name: @attributes[:data][:resp_name]}))

            create_household
          end

          def create_household
            @resource.households.create({ verification: true, agency: @attributes[:data][:bank_ag], account: @attributes[:data][:bank_cc],
                                          bank: JeraPayment::Household.bank_to_enumerize(@attributes[:data][:bank]),
                                          account_type: JeraPayment::Household.account_type_to_enumerize(@attributes[:data][:account_type]) })
          end
        end
      end
    end
  end
end
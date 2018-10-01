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
            begin
              ApplicationRecord.transaction do
                iugu_marketplace = JeraPayment::Api::Iugu::SubAccount.verify(@resource.account_id, @attributes, @resource.user_api_token)

                raise(StandardError, iugu_marketplace[:errors]) if iugu_marketplace[:errors].present?

                set_api_attributes(iugu_marketplace)
              end
            rescue Exception => error
              add_error(error.message)
            end

            @resource
          end

          private
          def set_api_attributes(attributes)
            @resource.assign_attributes(attributes.slice(:account_id, :live_api_token, :test_api_token, :user_token, :name)
                                                         .merge({resp_cpf: @attributes[:data][:resp_cpf], resp_name: @attributes[:data][:resp_name]}))

            create_household
          end

          def create_household
            @resource.households.create(@attributes[:data].slice(:bank_ag, :bank_cc).merge({ verification: true,
                                                                                             bank: JeraPayment::Household.to_enumerize(@attributes[:data][:bank]),
                                                                                             account_type: JeraPayment::Household.to_enumerize(@attributes[:data][:account_type]) }))
          end
        end
      end
    end
  end
end
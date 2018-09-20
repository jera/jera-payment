module JeraPayment
  module Services
    module Iugu
      module Customers
        class Update < JeraPayment::Services::Iugu::Base
          def initialize(resource, attributes)
            super
          end

          def call
            iugu_customer = JeraPayment::Api::Iugu::Customer.update(@resource.api_id, @attributes)

            if iugu_customer[:errors].present?
              add_error(iugu_customer[:errors])
            else
              set_api_attributes(iugu_customer)
            end

            @resource.errors.blank?
          end

          private
          def set_api_attributes(attributes)
            @resource.api_id = attributes[:id]
            @resource.assign_attributes(attributes.slice(:email, :name, :phone, :cpf_cpnj))
          end
        end
      end
    end
  end
end
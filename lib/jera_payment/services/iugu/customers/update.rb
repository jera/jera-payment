module JeraPayment
  module Services
    module Iugu
      module Customers
        class Update < JeraPayment::Services::Iugu::Base
          def initialize(customer, attributes)
            @customer = customer
            @attributes = attributes
          end

          def call
            iugu_customer = JeraPayment::Api::Iugu::Customer.update(@customer.api_id, @attributes)

            if iugu_customer[:errors].present?
              add_error(@customer, iugu_customer[:errors])
            else
              set_api_attributes(iugu_customer)
            end

            @customer.errors.blank?
          end

          private
          def set_api_attributes(attributes)
            @customer.api_id = attributes[:id]
            @customer.assign_attributes(attributes.slice(:email, :name, :phone, :cpf_cpnj))
          end
        end
      end
    end
  end
end
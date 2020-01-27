module JeraPayment
  module Services
    module Iugu
      module Customers
        class Create < JeraPayment::Services::Iugu::Base
          def call
            iugu_customer = JeraPayment::Api::Iugu::Customer.create(@attributes, @resource&.sub_account&.api_token)

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
            @resource.assign_attributes(attributes.slice(:email, :name, :phone, :cpf_cpnj, :city, :state, :street, :number, :zip_code))
          end
        end
      end
    end
  end
end
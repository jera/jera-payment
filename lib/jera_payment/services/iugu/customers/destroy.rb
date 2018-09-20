module JeraPayment
  module Services
    module Iugu
      module Customers
        class Destroy < JeraPayment::Services::Iugu::Base
          def initialize(customer)
            @customer = customer
          end

          def call
            iugu_delete_customer = JeraPayment::Api::Iugu::Customer.destroy(@customer.api_id)

            if iugu_delete_customer[:errors].present?
              add_error(@customer, iugu_delete_customer[:errors])
            else
              @customer.destroy
            end

            @customer.errors.blank?
          end

        end
      end
    end
  end
end
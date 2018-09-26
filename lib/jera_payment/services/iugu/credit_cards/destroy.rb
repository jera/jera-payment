module JeraPayment
  module Services
    module Iugu
      module CreditCards
        class Destroy < JeraPayment::Services::Iugu::Base
          def initialize(resource)
            super
          end

          def call
            iugu_delete = JeraPayment::Api::Iugu::PaymentMethod.destroy(@resource.customer.api_id, @resource.api_id)

            if iugu_delete[:errors].present?
              add_error(iugu_delete[:errors])
            else
              @resource.destroy
            end

            @resource.errors.blank?
          end

        end
      end
    end
  end
end
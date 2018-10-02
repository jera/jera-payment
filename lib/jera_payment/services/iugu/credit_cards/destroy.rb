module JeraPayment
  module Services
    module Iugu
      module CreditCards
        class Destroy < JeraPayment::Services::Iugu::Base
          def call
            iugu_delete = JeraPayment::Api::Iugu::PaymentMethod.destroy(@resource.customer.api_id, @resource.api_id,
                                                                        @resource.customer&.sub_account&.api_token)

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
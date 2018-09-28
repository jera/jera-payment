module JeraPayment
  module Services
    module Iugu
      module Customers
        class Destroy < JeraPayment::Services::Iugu::Base
          def initialize(resource)
            super
          end

          def call
            iugu_delete = eval("JeraPayment::Api::Iugu::Customer.destroy(@resource.api_id, @resource&.sub_account&.#{api_token})")

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
module JeraPayment
  module Services
    module Iugu
      module Subscriptions
        class Destroy < JeraPayment::Services::Iugu::Base
          def initialize(resource)
            super
          end

          def call
            iugu_subscription = JeraPayment::Api::Iugu::Subscription.destroy(@resource.api_id)

            if iugu_subscription[:errors].present?
              add_error(iugu_subscription[:errors])
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
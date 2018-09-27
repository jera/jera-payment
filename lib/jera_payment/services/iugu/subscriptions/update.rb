module JeraPayment
  module Services
    module Iugu
      module Subscriptions
        class Update < JeraPayment::Services::Iugu::Base
          def initialize(resource)
            super
          end

          def call
            iugu_subscription = JeraPayment::Api::Iugu::Subscription.update(@resource.api_id, @attributes.merge({customer_id: @resource.customer.api_id}))

            add_error(iugu_subscription[:errors]) if iugu_subscription[:errors].present?

            @resource.errors.blank?
          end
        end
      end
    end
  end
end
module JeraPayment
  module Services
    module Iugu
      module Subscriptions
        class UpdateCredits < JeraPayment::Services::Iugu::Base
          def initialize(resource, credits, action)
            @resource = resource
            @credits = { quantity: credits }
            @action = action
          end

          def call
            iugu_subscription_credits = eval("JeraPayment::Api::Iugu::Subscription.#{@action.to_s}_credits(@resource.api_id, @credits)")

            if iugu_subscription_credits[:errors].present?
              add_error(iugu_subscription_credits[:errors])
            else
              set_api_attributes(iugu_subscription_credits)
            end

            @resource.errors.blank?
          end

          private
          def set_api_attributes(attributes)
            @resource.update_columns(credits: attributes[:credits])
          end
        end
      end
    end
  end
end
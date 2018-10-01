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
            begin
              ApplicationRecord.transaction do
                iugu_subscription_credits = eval("JeraPayment::Api::Iugu::Subscription.#{@action.to_s}_credits(@resource.api_id, @credits,
                                                                                                               @resource&.customer&.sub_account&.api_token)")

                raise(StandardError, iugu_subscription_credits[:errors]) if iugu_subscription_credits[:errors].present?

                set_api_attributes(iugu_subscription_credits)
              end
            rescue Exception => error
              add_error(error.message)
            end

            @resource
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
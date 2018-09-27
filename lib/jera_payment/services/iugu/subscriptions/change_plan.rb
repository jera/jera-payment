module JeraPayment
  module Services
    module Iugu
      module Subscriptions
        class ChangePlan < JeraPayment::Services::Iugu::Base
          def initialize(resource, plan_identifier, simulation = nil)
            @resource = resource
            @plan_identifier = plan_identifier
            @simulation = simulation
          end

          def call
            iugu_change_subscription_plan = eval("JeraPayment::Api::Iugu::Subscription.change_plan#{@simulation.to_s}(@resource.api_id, @plan_identifier)")

            if iugu_change_subscription_plan[:errors].present?
              add_error(iugu_change_subscription_plan[:errors])
            else
              set_api_attributes(iugu_change_subscription_plan) unless @simulation.present?
            end

            @simulation.present? ? iugu_change_subscription_plan : @resource.errors.blank?
          end

          private
          def set_api_attributes(attributes)
            @resource.update_columns(plan_identifier: attributes[:plan_identifier])
          end
        end
      end
    end
  end
end
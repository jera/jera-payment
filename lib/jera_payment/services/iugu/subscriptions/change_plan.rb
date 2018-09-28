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
            begin
              ApplicationRecord.transaction do
                iugu_change_subscription_plan = eval("JeraPayment::Api::Iugu::Subscription.change_plan#{@simulation.to_s}(@resource.api_id, @plan_identifier,
                                                                                                                          @resource&.customer&.sub_account&.#{api_token})")

                raise(StandardError, iugu_change_subscription_plan[:errors]) if iugu_change_subscription_plan[:errors].present?

                if @simulation.present?
                  @resource = iugu_change_subscription_plan
                else
                  set_api_attributes(iugu_change_subscription_plan)
                end
              end
            rescue Exception => error
              add_error(error.message)
            end

            @resource
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
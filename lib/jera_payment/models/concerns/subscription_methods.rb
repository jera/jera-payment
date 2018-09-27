module JeraPayment
  module Concerns
    module SubscriptionMethods
      extend ActiveSupport::Concern

      included do
        def activate
          JeraPayment::Services::Iugu::Subscriptions::UpdateSituation.new(self, :activate).call
        end

        def suspend
          JeraPayment::Services::Iugu::Subscriptions::UpdateSituation.new(self, :suspend).call
        end

        def change_plan_simulation(plan_identifier)
          JeraPayment::Services::Iugu::Subscriptions::ChangePlan.new(self, plan_identifier, :_simulation).call
        end

        def change_plan(plan_identifier)
          JeraPayment::Services::Iugu::Subscriptions::ChangePlan.new(self, plan_identifier).call
        end

        def add_credits(attributes)
          JeraPayment::Services::Iugu::Subscriptions::UpdateCredits.new(self, attributes, :add).call
        end

        def remove_credits(attributes)
          JeraPayment::Services::Iugu::Subscriptions::UpdateCredits.new(self, attributes, :remove).call
        end

        def plan
          JeraPayment::Plan.find_by(identifier: self.plan_identifier)
        end
      end

    end
  end
end
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

        def add_credits(credits)
          JeraPayment::Services::Iugu::Subscriptions::UpdateCredits.new(self, credits, :add).call
        end

        def remove_credits(credits)
          JeraPayment::Services::Iugu::Subscriptions::UpdateCredits.new(self, credits, :remove).call
        end

        def plan
          JeraPayment::Plan.find_by(identifier: self.plan_identifier)
        end

        def subitems=(value)
          write_attribute(:subitems, value&.to_json)
        end

        def subitems
          ActiveSupport::JSON.decode(self[:subitems]).map{ |item| item.deep_symbolize_keys } if self[:subitems]
        end

        def custom_variables=(value)
          write_attribute(:custom_variables, value&.to_json)
        end

        def custom_variables
          ActiveSupport::JSON.decode(self[:custom_variables]).map{ |item| item.deep_symbolize_keys } if self[:custom_variables]
        end
      end

    end
  end
end
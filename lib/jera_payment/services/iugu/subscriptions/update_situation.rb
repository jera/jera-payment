module JeraPayment
  module Services
    module Iugu
      module Subscriptions
        class UpdateSituation < JeraPayment::Services::Iugu::Base
          def initialize(resource, action)
            @resource = resource
            @action = action
          end

          def call
            iugu_subscription = eval("JeraPayment::Api::Iugu::Subscription.#{@action.to_s}(@resource.api_id)")

            if iugu_subscription[:errors].present?
              add_error(iugu_subscription[:errors])
            else
              set_api_attributes(iugu_subscription)
            end

            @resource.errors.blank?
          end

          private
          def set_api_attributes(attributes)
            @resource.update_columns(suspended: attributes[:suspended], active: attributes[:active])
          end
        end
      end
    end
  end
end
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
            begin
              ApplicationRecord.transaction do
                iugu_subscription = eval("JeraPayment::Api::Iugu::Subscription.#{@action.to_s}(@resource.api_id)")

                raise(StandardError, iugu_subscription[:errors]) if iugu_subscription[:errors].present?

                set_api_attributes(iugu_subscription)
              end
            rescue Exception => error
              add_error(error.message)
            end

            @resource
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
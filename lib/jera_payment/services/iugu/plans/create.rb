module JeraPayment
  module Services
    module Iugu
      module Plans
        class Create < JeraPayment::Services::Iugu::Base
          def initialize(resource)
            super
          end

          def call
            iugu_plan = eval("JeraPayment::Api::Iugu::Plan.create(@attributes,
                                                                  @resource&.sub_account&.#{api_token})")

            if iugu_plan[:errors].present?
              add_error(iugu_plan[:errors])
            else
              set_api_attributes(iugu_plan)
            end

            @resource.errors.blank?
          end

          private
          def set_api_attributes(attributes)
            @resource.api_id = attributes[:id]
          end
        end
      end
    end
  end
end
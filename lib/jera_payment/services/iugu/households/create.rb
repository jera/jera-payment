module JeraPayment
  module Services
    module Iugu
      module Households
        class Create < JeraPayment::Services::Iugu::Base
          def initialize(resource)
            super
          end

          def call
            iugu_household = eval("JeraPayment::Api::Iugu::Household.create(@attributes, @resource&.sub_account&.api_token)")

            add_error(iugu_household[:errors]) if iugu_household[:errors].present?

            @resource.errors.blank?
          end

        end
      end
    end
  end
end
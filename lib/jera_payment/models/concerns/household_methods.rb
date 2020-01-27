module JeraPayment
  module Concerns
    module HouseholdMethods
      extend ActiveSupport::Concern

      included do
        after_create -> { ensure_current_household }, if: :is_verification?

        def has_update_callback?
          false
        end

        def has_create_callback?
          !is_verification?
        end

        def is_verification?
          self.verification
        end

        def has_destroy_callback?
          false
        end

        def ensure_current_household
          sub_account = self.sub_account
          sub_account.update_columns(current_household_id: self.id)
        end
      end

    end
  end
end
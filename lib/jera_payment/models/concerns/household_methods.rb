module JeraPayment
  module Concerns
    module HouseholdMethods
      extend ActiveSupport::Concern

      included do
        def has_update_callback?
          false
        end

        def has_create_callback?
          !self.verification
        end

        def has_destroy_callback?
          false
        end

        def self.to_enumerize(bank_name)
          bank_name.parameterize.underscore.to_sym
        end
      end

    end
  end
end
module JeraPayment
  module Concerns
    module TransferMethods
      extend ActiveSupport::Concern

      included do
        def has_update_callback?
          false
        end

        def has_destroy_callback?
          false
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
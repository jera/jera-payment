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
      end

    end
  end
end
module JeraPayment
  module Concerns
    module SubAccountMethods
      extend ActiveSupport::Concern

      included do
        def verify(attributes)
          JeraPayment::Services::Iugu::SubAccounts::Verify.new(self, attibutes).call
        end

        def has_destroy_callback?
          false
        end
      end

    end
  end
end
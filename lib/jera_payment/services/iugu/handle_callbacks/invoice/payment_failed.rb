module Iugu
  module HandleCallbacks
    module Invoice
      class PaymentFailed < Iugu::HandleCallbacks::Invoice::Base
        def initialize(params)
          super
        end

        def call
          super
        end

      end
    end
  end
end

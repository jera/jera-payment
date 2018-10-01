module Iugu
  module HandleCallbacks
    module Subscription
      class Suspended < Iugu::HandleCallbacks::Subscription::Base
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

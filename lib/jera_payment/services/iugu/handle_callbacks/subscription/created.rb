module JeraPayment
  module Services
    module Iugu
      module HandleCallbacks
        module Subscription
          class Created < Iugu::HandleCallbacks::Subscription::Base
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
  end
end

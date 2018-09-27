module JeraPayment
  module Services
    module Iugu
      module HandleCallbacks
        module Subscription
          class Base
            def initialize(params)
              @params = params
            end

            def call
              Rails.logger.info("======> #{@params}")
            end

          end
        end
      end
    end
  end
end

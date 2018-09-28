module Iugu
  module HandleCallbacks
    module Subscription
      class Base
        def initialize(params)
          @params = params
        end

        def call
          Rails.logger.info("======> #{@params}")

          return 200
        end

      end
    end
  end
end

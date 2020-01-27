module Iugu
  module HandleCallbacks
    module WithdrawRequest
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

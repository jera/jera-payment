module Iugu
  module HandleCallbacks
    module WithdrawRequest
      class StatusChanged
        def initialize(params)
          super
        end

        def call
          Rails.logger.info("======> #{@params}")

          @withdrawal = JeraPayment::Withdrawal.find_by(api_id: @params["data"]["id"])

          return 404 unless @withdrawal.present?

          @withdrawal.update(status: @params["data"]["status"], feedback: @params["data"]["feedback"])

          return 200
        end

      end
    end
  end
end

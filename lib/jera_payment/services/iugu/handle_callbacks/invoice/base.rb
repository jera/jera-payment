module Iugu
  module HandleCallbacks
    module Invoice
      class Base
        def initialize(params)
          @params = params
        end

        def call
          Rails.logger.info("======> #{@params}")

          @invoice = ::JeraPayment::Invoice.find_by(api_id: @params["data"]["id"])

          return 404 unless @invoice.present?

          return 200 if @invoice.update(status: @params["data"]["status"])

          return 500
        end

      end
    end
  end
end

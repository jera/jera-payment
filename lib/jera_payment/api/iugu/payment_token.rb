module JeraPayment
  module Api
    module Iugu
      class PaymentToken < Base
        BASE_ENDPOINT = 'payment_token'
        def self.create(body = {}, access_token = nil)
          response = post(BASE_ENDPOINT, body, access_token)
        end
      end
    end
  end
end
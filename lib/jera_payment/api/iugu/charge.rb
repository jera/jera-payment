module JeraPayment
  module Api
    module Iugu
      class Charge < Base
        BASE_ENDPOINT = 'charge'
        def self.create(body = {}, access_token = nil)
          response = post(BASE_ENDPOINT, body, access_token)
        end
      end
    end
  end
end
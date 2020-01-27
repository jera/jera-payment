module JeraPayment
  module Api
    module Iugu
      class Household < Base
        BASE_ENDPOINT = 'bank_verification'

        def self.create(body = {}, access_token = nil)
          response = post(BASE_ENDPOINT, body, access_token)
        end
      end
    end
  end
end
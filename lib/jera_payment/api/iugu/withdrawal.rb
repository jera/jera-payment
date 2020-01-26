module JeraPayment
  module Api
    module Iugu
      class Withdrawal < Base
        BASE_ENDPOINT = 'withdraw_requests'

        def self.request_withdrawal(id, body = {}, access_token = nil)
          url = "accounts/#{id}/request_withdraw"

          response = post(url, body, access_token)
        end

        def self.index(query = nil, limit = nil, start = nil, access_token = nil)
          response = HTTParty.get(
            "#{BASE_ENDPOINT}?query=#{query}&limit=#{limit}&start=#{start}",
            headers: set_headers(access_token),
          )
          parse_response(response)
        end

        def self.show(id, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}"

          response = get(url, nil, access_token)
        end

      end
    end
  end
end
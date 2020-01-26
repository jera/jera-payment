module JeraPayment
  module Api
    module Iugu
      class Transfer < Base
        BASE_ENDPOINT = 'transfers'

        def self.create(body = {}, access_token = nil)
          response = post(BASE_ENDPOINT, body, access_token)
        end

        def self.index(limit = nil, start = nil, access_token = nil)
          response = HTTParty.get(
            "#{JeraPayment.iugu_base_url}/#{BASE_ENDPOINT}?limit=#{limit}&start=#{start}",
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
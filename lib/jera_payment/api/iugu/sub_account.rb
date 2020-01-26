module JeraPayment
  module Api
    module Iugu
      class SubAccount < Base
        BASE_ENDPOINT = 'accounts'

        def self.create(body = {}, access_token = nil)
          url = 'marketplace/create_account'

          response = post(url, body, access_token)
        end

        def self.update(body = {}, access_token = nil)
          url = "#{BASE_ENDPOINT}/configuration"

          response = post(url, body, access_token)
        end

        def self.verify(id, body = {}, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}/request_verification"

          response = post(url, body, access_token)
        end

        def self.show(id, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}"

          response = get(url, nil, access_token)
        end

        def self.list_accounts(query = nil, limit = nil, start = nil, access_token = nil)
          url = 'marketplace'
          response = HTTParty.get(
            "#{JeraPayment.iugu_base_url}/#{url}?query=#{query}&limit=#{limit}&start=#{start}",
            headers: set_headers(access_token),
          )
          parse_response(response)
        end

      end
    end
  end
end
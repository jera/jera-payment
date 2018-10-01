module JeraPayment
  module Api
    module Iugu
      class Transfer < Base
        BASE_ENDPOINT = 'transfers'

        def self.create(body = {}, access_token = nil)
          response = post(BASE_ENDPOINT, body, access_token)
        end

        def self.index(query = nil, access_token = nil)
          response = get(BASE_ENDPOINT, query, access_token)
        end

        def self.show(id, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}"

          response = get(url, nil, access_token)
        end

      end
    end
  end
end
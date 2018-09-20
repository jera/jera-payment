module JeraPayment
  module Api
    module Iugu
      class Customer < Base

        BASE_ENDPOINT = 'customers'

        def self.index(query = nil, access_token = nil)
          response = get(BASE_ENDPOINT, query, access_token)
        end

        def self.show(id, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}"

          response = get(url, nil, access_token)
        end

        def self.create(body = {}, access_token = nil)
          response = post(BASE_ENDPOINT, body, access_token)
        end

        def self.update(id, body = {}, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}"

          response = put(url, body, access_token)
        end

        def self.destroy(id, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}"

          response = delete(url, access_token)
        end

      end
    end
  end
end
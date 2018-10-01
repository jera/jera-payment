module JeraPayment
  module Api
    module Iugu
      class SubAccount < Base
        BASE_ENDPOINT = 'accounts'

        def self.create(body = {}, access_token = nil)
          url = 'marketplace/create_account'

          response = post(url, body, access_token)
        end

        def self.update(id, body = {}, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}"

          response = put(url, body, access_token)
        end

        def self.verify(id, body = {}, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}/request_verification"

          response = post(url, body, access_token)
        end

        def self.show(id, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}"

          response = get(url, nil, access_token)
        end

        def self.request_withdrawal(id, body = {}, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}/request_withdraw"

          response = post(url, body, access_token)
        end

        def self.list_accounts(query = nil, access_token = nil)
          url = 'marketplace'

          response = get(url, query, access_token)
        end

      end
    end
  end
end
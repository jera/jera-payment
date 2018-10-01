module JeraPayment
  module Api
    module Iugu
      class Subscription < Base
        BASE_ENDPOINT = 'subscriptions'

        def self.create(body = {}, access_token = nil)
          response = post(BASE_ENDPOINT, body, access_token)
        end

        def self.activate(id, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}/activate"

          response = post(url, nil, access_token)
        end

        def self.suspend(id, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}/suspend"

          response = post(url, nil, access_token)
        end

        def self.change_plan_simulation(id, plan_identifier, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}/change_plan_simulation/#{plan_identifier}"

          response = get(url, nil, access_token)
        end

        def self.change_plan(id, plan_identifier, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}/change_plan/#{plan_identifier}"

          response = post(url, nil, access_token)
        end

        def self.add_credits(id, body = {}, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}/add_credits"

          response = put(url, body, access_token)
        end

        def self.remove_credits(id, body = {}, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}/remove_credits"

          response = put(url, body, access_token)
        end

        def self.update(id, body = {}, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}"

          response = put(url, body, access_token)
        end

        def self.destroy(id, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}"

          response = delete(url, access_token)
        end

        def self.show(id, access_token = nil)
          url = "#{BASE_ENDPOINT}/#{id}"

          response = get(url, nil, access_token)
        end

        def self.index(query = nil, access_token = nil)
          response = get(BASE_ENDPOINT, query, access_token)
        end

      end
    end
  end
end
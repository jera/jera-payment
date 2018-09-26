module JeraPayment
  module Api
    module Iugu
      class PaymentMethod < Base

        def self.index(customer_id, access_token = nil)
          url = "customers/#{customer_id}/payment_methods"

          response = get(url, nil, access_token)
        end

        def self.show(customer_id, id, access_token = nil)
          url = "customers/#{customer_id}/payment_methods/#{id}"

          response = get(url, nil, access_token)
        end

        def self.create(customer_id, body = {}, access_token = nil)
          url = "customers/#{customer_id}/payment_methods"

          response = post(url, body, access_token)
        end

        def self.update(customer_id, id, body = {}, access_token = nil)
          url = "customers/#{customer_id}/payment_methods/#{id}"

          response = put(url, body, access_token)
        end

        def self.destroy(customer_id, id, access_token = nil)
          url = "customers/#{customer_id}/payment_methods/#{id}"

          response = delete(url, access_token)
        end

      end
    end
  end
end
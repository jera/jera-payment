require 'base64'
require 'json'
require 'httparty'

module JeraPayment
  module Api
    module Iugu
      class Base

        def self.get(endpoint, query, account_access_token)
          response = HTTParty.get("#{JeraPayment.iugu_base_url}/#{endpoint}", headers: set_headers(account_access_token), query: query)
          parse_response(response)
        end

        def self.post(endpoint, body, account_access_token)
          response = HTTParty.post("#{JeraPayment.iugu_base_url}/#{endpoint}", headers: set_headers(account_access_token), body: body.to_json)
          parse_response(response)
        end

        def self.put(endpoint, body, account_access_token)
          response = HTTParty.put("#{JeraPayment.iugu_base_url}/#{endpoint}", headers: set_headers(account_access_token), body: body.to_json)
          parse_response(response)
        end

        def self.delete(endpoint, account_access_token)
          response = HTTParty.delete("#{JeraPayment.iugu_base_url}/#{endpoint}", headers: set_headers(account_access_token))
          parse_response(response)
        end

        def self.set_headers(account_access_token)
          return { 'Content-Type': 'application/json', 'Authorization': "Basic #{Base64.encode64(ensure_account_access_token(account_access_token))}" }
        end

        def self.ensure_account_access_token(account_access_token)
          if account_access_token.nil?
            account_access_token = JeraPayment.is_test ? JeraPayment.api_key_test : JeraPayment.api_key
          else
            account_access_token
          end
        end

        def self.parse_response(response)
          if response.parsed_response.is_a?(Array) && response.parsed_response.first.is_a?(Hash)
            response.parsed_response.map(&:deep_symbolize_keys)
          elsif response.parsed_response.is_a?(Hash)
            response.parsed_response.deep_symbolize_keys
          else
            response.parsed_response
          end
        end

      end
    end
  end
end

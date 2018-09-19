require 'httparty'

module JeraPayment

  mattr_accessor :api
  @@api = nil

  mattr_accessor :api_key
  @@api_key = nil

  mattr_accessor :api_key_test
  @@api_key_test = nil

  mattr_accessor :account_id
  @@account_id = nil

  mattr_accessor :is_test
  @@is_test = nil

  def self.setup
    yield self
  end

  @iugu_base_url = 'https://api.iugu.com/v1/'

  def self.iugu_base_url
    @base_url
  end
end

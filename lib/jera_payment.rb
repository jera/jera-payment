require 'httparty'
require 'jera_payment/engine'


require_relative 'jera_payment/api/iugu/base'
require_relative 'jera_payment/api/iugu/customer'

require_relative 'jera_payment/services/iugu/base'
require_relative 'jera_payment/services/iugu/customers/create'
require_relative 'jera_payment/services/iugu/customers/update'
require_relative 'jera_payment/services/iugu/customers/destroy'

module JeraPayment

  autoload :Customer, 'jera_payment/models/customer.rb'

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

  @iugu_base_url = 'https://api.iugu.com/v1'

  def self.iugu_base_url
    @iugu_base_url
  end
end

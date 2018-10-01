require 'jera_payment/application'

module JeraPayment

  autoload :Customer, 'jera_payment/models/customer.rb'
  autoload :CreditCard, 'jera_payment/models/credit_card.rb'
  autoload :Invoice, 'jera_payment/models/invoice.rb'
  autoload :Charge, 'jera_payment/models/charge.rb'
  autoload :Plan, 'jera_payment/models/plan.rb'
  autoload :Subscription, 'jera_payment/models/subscription.rb'
  autoload :SubAccount, 'jera_payment/models/sub_account.rb'

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

class JeraPayment::SubAccount < ActiveRecord::Base
  include JeraPayment::Concerns::ResourceCallbacks

  self.table_name = "jera_payment_customers"

  has_many :plans, class_name: 'JeraPayment::Plan'
  has_many :customers, class_name: 'JeraPayment::Customer', optional: true

  belongs_to :sub_accountable, polymorphic: true

  def api_token
    JeraPayment.is_test ? 'test_api_token' : 'live_api_token'
  end

end
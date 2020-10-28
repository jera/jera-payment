class JeraPayment::CreditCard < ActiveRecord::Base
  include JeraPayment::Concerns::ResourceCallbacks

  attr_readonly :customer_id, :api_id, :brand, :number, :first_name, :last_name, :cvv, :month, :year, :test

  self.table_name = "jera_payment_credit_cards"

  belongs_to :customer, class_name: 'JeraPayment::Customer'

end

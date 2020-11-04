class JeraPayment::CreditCard < ActiveRecord::Base
  include JeraPayment::Concerns::ResourceCallbacks

  attr_readonly :customer_id, :api_id, :brand, :number, :first_name, :last_name,
                :cvv, :month, :year, :set_as_default, :test

  self.table_name = "jera_payment_credit_cards"

  belongs_to :customer, class_name: 'JeraPayment::Customer'

  after_create :set_as_default_in_customer

  def set_as_default_in_customer	
    self.customer.update_column(:current_credit_card_id, self.id)	unless self.set_as_default.present?
  end

end

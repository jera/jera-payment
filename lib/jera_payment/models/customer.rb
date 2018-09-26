class JeraPayment::Customer < ActiveRecord::Base
  include JeraPayment::Concerns::ResourceCallbacks

  self.table_name = "jera_payment_customers"

  has_many :credit_cards, class_name: 'JeraPayment::CreditCard'
  has_many :invoices, class_name: 'JeraPayment::Invoice'

  belongs_to :customerable, polymorphic: true
  belongs_to :current_credit_card, class_name: 'JeraPayment::CreditCard', foreign_key: :current_credit_card_id, optional: true

end
class JeraPayment::Customer < ActiveRecord::Base
  include JeraPayment::Concerns::ResourceCallbacks

  self.table_name = "jera_payment_customers"

  has_many :credit_cards, class_name: 'JeraPayment::CreditCard'
  has_many :invoices, class_name: 'JeraPayment::Invoice'
  has_many :subscriptions, class_name: 'JeraPayment::Subscription'

  belongs_to :sub_account, class_name: 'JeraPayment::SubAccount', optional: true
  belongs_to :customerable, polymorphic: true
  belongs_to :current_credit_card, class_name: 'JeraPayment::CreditCard', foreign_key: :current_credit_card_id, optional: true

end
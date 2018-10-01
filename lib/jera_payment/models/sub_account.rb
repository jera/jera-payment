class JeraPayment::SubAccount < ActiveRecord::Base
  include JeraPayment::Concerns::ResourceCallbacks
  include JeraPayment::Concerns::SubAccountMethods

  self.table_name = "jera_payment_sub_accounts"

  has_many :plans, class_name: 'JeraPayment::Plan'
  has_many :customers, class_name: 'JeraPayment::Customer'
  has_many :withdrawals, class_name: 'JeraPayment::Withdrawal'

  belongs_to :sub_accountable, polymorphic: true

end
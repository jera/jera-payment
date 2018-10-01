class JeraPayment::SubAccount < ActiveRecord::Base
  include JeraPayment::Concerns::ResourceCallbacks
  include JeraPayment::Concerns::SubAccountMethods

  self.table_name = "jera_payment_sub_accounts"

  attr_readonly :resp_name, :resp_cpf, :can_receive?, :is_verified?, :last_verification_request_feedback

  has_many :plans, class_name: 'JeraPayment::Plan'
  has_many :customers, class_name: 'JeraPayment::Customer'
  has_many :withdrawals, class_name: 'JeraPayment::Withdrawal'
  has_many :households, class_name: 'JeraPayment::Household'
  has_many :transfers, class_name: 'JeraPayment::Transfer'

  belongs_to :sub_accountable, polymorphic: true
  belongs_to :current_household, class_name: 'JeraPayment::Household', foreign_key: :current_household_id, optional: true

end
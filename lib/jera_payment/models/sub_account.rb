class JeraPayment::SubAccount < ActiveRecord::Base
  include JeraPayment::Concerns::ResourceCallbacks
  include JeraPayment::Concerns::SubAccountMethods

  self.table_name = "jera_payment_sub_accounts"

  has_many :plans, class_name: 'JeraPayment::Plan'
  has_many :customers, class_name: 'JeraPayment::Customer'
  has_many :withdrawals, class_name: 'JeraPayment::Withdrawal'
  has_many :households, class_name: 'JeraPayment::Household'
  has_many :transfers, class_name: 'JeraPayment::Transfer'
  has_many :invoices, class_name: 'JeraPayment::Invoice'
  has_many :charges, class_name: 'JeraPayment::Charge'

  belongs_to :sub_accountable, polymorphic: true
  belongs_to :current_household, class_name: 'JeraPayment::Household', foreign_key: :current_household_id, optional: true

  def api_token
    JeraPayment.is_test ? self.test_api_token : self.live_api_token
  end

  def comissions=(value)
    write_attribute(:comissions, value&.to_json)
  end

  def comissions
    ActiveSupport::JSON.decode(self[:comissions]) if self[:comissions]
  end

  def bank_slip=(value)
    write_attribute(:bank_slip, value&.to_json)
  end

  def bank_slip
    ActiveSupport::JSON.decode(self[:bank_slip]) if self[:bank_slip]
  end

  def credit_card=(value)
    write_attribute(:credit_card, value&.to_json)
  end

  def credit_card
    ActiveSupport::JSON.decode(self[:credit_card]) if self[:credit_card]
  end

  def early_payment_discounts=(value)
    write_attribute(:early_payment_discounts, value&.to_json)
  end

  def early_payment_discounts
    ActiveSupport::JSON.decode(self[:early_payment_discounts]).map{ |early_payment_discounts| early_payment_discounts.deep_symbolize_keys } if self[:early_payment_discounts]
  end
end
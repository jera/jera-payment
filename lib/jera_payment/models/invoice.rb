class JeraPayment::Invoice < ActiveRecord::Base
  require 'enumerize'

  include JeraPayment::Concerns::ResourceCallbacks
  include JeraPayment::Concerns::InvoiceMethods
  extend Enumerize

  attr_readonly :api_id, :customer, :email, :cc_emails, :due_date,
                :ensure_workday_due_date, :items, :comissions, :total_cents, :discount_cents,
                :payable_with, :return_url, :expired_url, :notification_url, :fines,
                :late_payment_fine, :per_day_interest, :ignore_due_email, :subscription_api_id,
                :credits, :early_payment_discount, :early_payment_discounts, :payer, :paid_at,
                :secure_url, :digitable_line, :barcode_data, :barcode

  self.table_name = 'jera_payment_invoices'

  enumerize :status, in: { pending: 0, paid: 1, canceled: 2, partially_paid: 3, refunded: 4, expired: 5,
                          authorized: 6, in_protest: 7, chargeback: 8, in_analysis: 9 }, predicates: true, scope: true, default: :pending

  belongs_to :customer, class_name: 'JeraPayment::Customer', optional: true

  belongs_to :sub_account, class_name: 'JeraPayment::SubAccount', optional: true

  has_one :charge, class_name: 'JeraPayment::Charge'

  def items=(value)
    write_attribute(:items, value&.to_json)
  end

  def items
    ActiveSupport::JSON.decode(self[:items]) if self[:items]
  end

  def comissions=(value)
    write_attribute(:comissions, value&.to_json)
  end

  def comissions
    ActiveSupport::JSON.decode(self[:comissions]) if self[:comissions]
  end

  def early_payment_discounts=(value)
    write_attribute(:items, value&.to_json)
  end

  def early_payment_discounts
    ActiveSupport::JSON.decode(self[:early_payment_discounts]).map{ |early_payment_discount| early_payment_discount.deep_symbolize_keys } if self[:early_payment_discounts]
  end

  def payer=(value)
    write_attribute(:payer, value&.to_json)
  end

  def payer
    ActiveSupport::JSON.decode(self[:payer]) if self[:payer]
  end

end

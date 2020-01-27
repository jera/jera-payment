class JeraPayment::Withdrawal < ActiveRecord::Base
  require 'enumerize'

  include JeraPayment::Concerns::ResourceCallbacks
  include JeraPayment::Concerns::WithdrawalMethods
  extend Enumerize

  attr_readonly :api_id, :sub_account, :amount, :custom_variables

  self.table_name = 'jera_payment_withdrawals'

  belongs_to :sub_account, class_name: 'JeraPayment::SubAccount'

  enumerize :status, in: { pending: 0, processing: 1, rejected: 2, accepted: 3 }, predicates: true, scope: true, default: :pending

  def custom_variables=(value)
    write_attribute(:custom_variables, value&.to_json)
  end

  def custom_variables
    ActiveSupport::JSON.decode(self[:custom_variables]).map{ |item| item.deep_symbolize_keys } if self[:custom_variables]
  end

end
class JeraPayment::Withdrawal < ActiveRecord::Base
  include JeraPayment::Concerns::ResourceCallbacks

  attr_readonly :api_id, :sub_account, :amount, :custom_variables  

  self.table_name = 'jera_payment_withdrawals'

  belongs_to :sub_account, class_name: 'JeraPayment::SubAccount'

  enumerize :status, in: { pending: 0, processing: 1, rejected: 2, accepted: 3 }, predicates: true, scope: true, default: :pending

  def has_update_callback?
    false
  end

  def has_destroy_callback?
    false
  end

end
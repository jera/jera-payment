class JeraPayment::Transfer < ActiveRecord::Base
  include JeraPayment::Concerns::ResourceCallbacks
  include JeraPayment::Concerns::TransferMethods

  attr_readonly :api_id, :sub_account_id, :receiver, :amount_cents, :amount_localized, :custom_variables

  self.table_name = 'jera_payment_transfers'

  belongs_to :sub_account, class_name: 'JeraPayment::SubAccount'
  belongs_to :receiver, class_name: 'JeraPayment::SubAccount'

  def custom_variables=(value)
    write_attribute(:custom_variables, value&.to_json)
  end

  def custom_variables
    ActiveSupport::JSON.decode(self[:custom_variables]).map{ |item| item.deep_symbolize_keys } if self[:custom_variables]
  end

end
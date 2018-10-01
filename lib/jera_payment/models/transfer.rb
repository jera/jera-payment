class JeraPayment::Transfer < ActiveRecord::Base
  include JeraPayment::Concerns::ResourceCallbacks
  include JeraPayment::Concerns::TransferMethods

  attr_readonly

  self.table_name = 'jera_payment_transfers'

  belongs_to :sub_account, class_name: 'JeraPayment::SubAccount'
  belongs_to :receiver, class_name: 'JeraPayment::SubAccount'

end
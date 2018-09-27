class JeraPayment::Plan < ActiveRecord::Base
  include JeraPayment::Concerns::ResourceCallbacks

  self.table_name = 'jera_payment_plans'

  def features=(value)
    write_attribute(:items, value&.to_json)
  end

  def features
    ActiveSupport::JSON.decode(self[:items]).map{ |item| item.deep_symbolize_keys } if self[:items]
  end
end
class JeraPayment::Subscription < ActiveRecord::Base
  include JeraPayment::Concerns::ResourceCallbacks
  include JeraPayment::Concerns::SubscriptionMethods

  self.table_name = 'jera_payment_subscriptions'

  belongs_to :customer, class_name: 'JeraPayment::Customer'

  def subitems=(value)
    write_attribute(:subitems, value&.to_json)
  end

  def subitems
    ActiveSupport::JSON.decode(self[:subitems]).map{ |item| item.deep_symbolize_keys } if self[:subitems]
  end

  def custom_variables=(value)
    write_attribute(:custom_variables, value&.to_json)
  end

  def custom_variables
    ActiveSupport::JSON.decode(self[:custom_variables]).map{ |item| item.deep_symbolize_keys } if self[:custom_variables]
  end
end
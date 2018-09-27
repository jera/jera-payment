class JeraPayment::Subscription < ActiveRecord::Base
  include JeraPayment::Concerns::ResourceCallbacks
  include JeraPayment::Concerns::SubscriptionMethods

  self.table_name = 'jera_payment_subscriptions'

  belongs_to :customer, class_name: 'JeraPayment::Customer'

end
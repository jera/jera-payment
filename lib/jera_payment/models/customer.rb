class JeraPayment::Customer < ActiveRecord::Base
  self.table_name = "jera_payment_customers"

  belongs_to :customerable, polymorphic: true

  before_create :create_api_customer
  before_update :update_api_customer
  before_destroy :destroy_api_customer

  def create_api_customer
    api_creation = JeraPayment::Services::Iugu::Customers::Create.new(self, self.attributes).call
    throw(:abort) unless api_creation
  end

  def update_api_customer
    api_update = JeraPayment::Services::Iugu::Customers::Update.new(self, self.attributes).call
    throw(:abort) unless api_update
  end

  def destroy_api_customer
    api_destroy = JeraPayment::Services::Iugu::Customers::Destroy.new(self).call
    throw(:abort) unless api_destroy
  end
end
class JeraPayment::Customer < ActiveRecord::Base
  self.table_name = "jera_payment_customers"

  belongs_to :customerable, polymorphic: true

  before_create :create_api_customer_on_iugu
  before_update :update_customer_on_iugu
  before_destroy :destroy_customer_on_iugu

  def create_api_customer
    response = JeraPayment::Services::Iugu::Customers::Create.new(self.attributes).call

    self.iugu_id = response[:id]
  end

  def update_customer_on_iugu
    response = SimpleIugu::Api::Customer.update(self.iugu_id, self.attributes)

    if response[:errors].present?
      response[:errors].map{ |error| self.errors.messages.merge(error) }
      return false
    end
  end

  def destroy_customer_on_iugu
    response = SimpleIugu::Api::Customer.destroy(self.iugu_id)

    if response[:errors].present?
      response[:errors].map{ |error| self.errors.messages.merge(error) }
      return false
    end

    self.destroy
  end
end
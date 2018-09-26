class JeraPayment::Charge < ActiveRecord::Base
  include JeraPayment::Concerns::ResourceCallbacks

  self.table_name = 'jera_payment_charges'

  attr_readonly :invoice_id, :method, :token, :customer_payment_method_id, :restrict_payment_method,
                :customer_id, :email, :months, :discount_cents, :bank_slip_extra_days, :keep_dunning,
                :items, :cpf_cnpj, :name, :phone_prefix, :phone, :email, :zip_code, :street, :number,
                :neighborhood, :city, :state, :country, :complement, :url, :pdf, :identification

  belongs_to :invoice, class_name: 'JeraPayment::Invoice'

  def has_update_callback?
    false
  end

  def has_destroy_callback?
    false
  end

  def items=(value)
    write_attribute(:items, value&.to_json)
  end

  def items
    ActiveSupport::JSON.decode(self[:items]).map{ |item| item.deep_symbolize_keys } if self[:items]
  end

end
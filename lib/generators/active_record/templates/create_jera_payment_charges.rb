class CreateJeraPaymentCharges < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :jera_payment_charges do |t|
      t.belongs_to :invoice
      t.belongs_to :sub_account
      t.string     :method
      t.string     :token
      t.string     :customer_payment_method_api_id
      t.boolean    :restrict_payment_method
      t.string     :customer_api_id
      t.string     :email
      t.integer    :months
      t.integer    :discount_cents
      t.integer    :bank_slip_extra_days
      t.boolean    :keep_dunning
      t.text       :items
      t.string     :cpf_cnpj
      t.string     :name
      t.string     :phone_prefix
      t.string     :phone
      t.string     :zip_code
      t.string     :street
      t.string     :number
      t.string     :neighborhood
      t.string     :city
      t.string     :state
      t.string     :country
      t.string     :complement
      t.string     :url
      t.string     :pdf
      t.string     :identification

      t.timestamps null: false
    end
  end
end
class CreateJeraPaymentCustomers < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :jera_payment_customers do |t|

      t.string :api_id
      t.string :email
      t.string :name
      t.integer :phone
      t.string :cpf_cnpj
      t.string :city
      t.string :state
      t.string :street
      t.string :number
      t.string :zip_code
      t.references :customerable, polymorphic: true, index: {name: 'index_jera_payment_customers_on_customerable' }
      t.references :current_credit_card
      t.references :sub_account

      t.timestamps null: false
    end
  end
end

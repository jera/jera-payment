class CreateJeraPaymentCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :jera_payment_customers do |t|

      t.string :api_id
      t.string :email
      t.string :name
      t.integer :phone
      t.string :cpf_cpnj
      t.references :customerable, polymorphic: true, index: {name: 'index_jera_payment_customers_on_customerable' }

      t.timestamps null: false
    end
  end
end

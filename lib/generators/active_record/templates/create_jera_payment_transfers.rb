class CreateJeraPaymentTransfers < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :jera_payment_transfers do |t|

      t.string :api_id
      t.references :sub_account
      t.references :receiver
      t.integer :amount_cents
      t.string :amount_localized
      t.text :custom_variables

      t.timestamps null: false
    end
  end
end
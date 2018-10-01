class CreateJeraPaymentHouseholds < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :jera_payment_households do |t|

      t.references :sub_account
      t.string :agency
      t.string :account
      t.integer :account_type
      t.integer :bank
      t.string :document
      t.integer :status
      t.string :feedback
      t.boolean :verification, default: true

      t.timestamps null: false
    end
  end
end
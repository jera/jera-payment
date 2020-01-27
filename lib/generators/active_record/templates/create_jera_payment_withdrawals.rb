class CreateJeraPaymentWithdrawals < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :jera_payment_withdrawals do |t|

      t.string :api_id
      t.float :amount
      t.text :custom_variables
      t.integer :status
      t.string :feedback
      t.references :sub_account

      t.timestamps null: false
    end
  end
end
class CreateJeraPaymentCreditCards < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :jera_payment_credit_cards do |t|

      t.references :customer
      t.string     :api_id
      t.string     :brand
      t.string     :number
      t.string     :first_name
      t.string     :last_name
      t.string     :cvv
      t.string     :month
      t.string     :year
      t.string     :description
      t.boolean    :test

      t.timestamps null: false
    end
  end
end
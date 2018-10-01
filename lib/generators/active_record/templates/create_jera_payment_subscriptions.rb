class CreateJeraPaymentSubscriptions < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :jera_payment_subscriptions do |t|

      t.string :api_id
      t.belongs_to :customer
      t.string :plan_identifier
      t.string :expires_at
      t.boolean :only_on_charge_success
      t.boolean :ignore_due_email
      t.string :payable_with
      t.boolean :credits_based
      t.integer :price_cents
      t.integer :credits_cycle
      t.integer :credits_min
      t.text :subitems
      t.text :custom_variables
      t.boolean :suspended
      t.boolean :active
      t.boolean :skip_charge
      t.string :credits

      t.timestamps null: false
    end
  end
end
class CreateJeraPaymentPlans < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :jera_payment_plans do |t|

      t.string  :api_id
      t.string  :name
      t.string  :identifier
      t.integer :interval
      t.string  :interval_type
      t.integer :value_cents
      t.string  :payable_with
      t.text    :features

      t.timestamps null: false
    end
  end
end
class CreateJeraPaymentSubAccounts < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :jera_payment_subs_accounts do |t|

      t.references :current_household
      t.references :sub_accountable, polymorphic: true, index: {name: 'index_jera_payment_sub_accounts_on_sub_accountable' }
      t.string :account_id
      t.string :live_api_token
      t.string :test_api_token
      t.string :user_api_token
      t.string :name
      t.text :comissions
      t.boolean :auto_withdrawal
      t.boolean :fines
      t.boolean :per_day_interest
      t.integer :late_payment_fine
      t.boolean :auto_advance
      t.string :auto_advance_type
      t.integer :auto_advance_option
      t.text :bank_slip
      t.text :credit_card
      t.boolean :payment_email_notification
      t.string :payment_email_notification_receiver
      t.boolean :early_payment_discount
      t.text :early_payment_discounts
      t.integer :subscriptions_billing_days
      t.integer :subscriptions_trial_period
      t.string :default_return_url
      t.string :owner_emails_to_notify
      t.string :resp_name
      t.string :resp_cpf
      t.boolean :can_receive?
      t.boolean :is_verified?
      t.string :last_verification_request_feedback

      t.timestamps null: false
    end
  end
end
class CreateJeraPaymentInvoices < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :jera_payment_invoices do |t|

      t.string     :api_id
      t.belongs_to :customer
      t.integer    :status
      t.string     :email
      t.string     :cc_emails
      t.string     :due_date
      t.boolean    :ensure_workday_due_date
      t.text       :items
      t.integer    :total_cents
      t.integer    :discount_cents
      t.string     :payable_with
      t.string     :return_url
      t.string     :expired_url
      t.string     :notification_url
      t.boolean    :fines
      t.string     :late_payment_fine
      t.boolean    :per_day_interest
      t.boolean    :ignore_due_email, default: false
      t.boolean    :ignore_canceled_email
      t.boolean    :current_fines_option
      t.boolean    :keep_early_payment_discount
      t.string     :subscription_api_id
      t.integer    :credits
      t.boolean    :early_payment_discount, default: false
      t.text       :early_payment_discounts
      t.string     :cpf_cnpj
      t.string     :name
      t.string     :phone_prefix
      t.string     :phone
      t.string     :email
      t.string     :zip_code
      t.string     :street
      t.string     :number
      t.string     :neighborhood
      t.string     :city
      t.string     :state
      t.string     :country
      t.string     :complement
      t.string     :paid_at
      t.string     :secure_url
      t.string     :digitable_line
      t.string     :barcode_data
      t.string     :barcode
      t.boolean    :duplicated, default: false

      t.timestamps null: false
    end
  end
end
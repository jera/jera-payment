module JeraPayment
  module Parsers
    module Iugu
      class InvoiceParser
        def self.invoice_creation(resource)
          {
            email: resource.email,
            cc_emails: resource.cc_emails,
            due_date: resource.due_date.to_date.strftime("%Y/%m/%d/"),
            ensure_workday_due_date: resource.ensure_workday_due_date,
            items: resource.items,
            return_url: resource.return_url,
            expired_url: resource.expired_url,
            notification_url: resource.notification_url,
            fines: resource.fines,
            late_payment_fine: resource.late_payment_fine,
            per_day_interest: resource.per_day_interest,
            discount_cents: resource.discount_cents,
            ignore_due_email: resource.ignore_due_email,
            subscription_id: resource.subscription_api_id,
            payable_with: resource.payable_with,
            credits: resource.credits,
            early_payment_discount: resource.early_payment_discount,
            early_payment_discounts: resource.early_payment_discounts,
            payer: resource.payer
          }
        end
      end
    end
  end
end
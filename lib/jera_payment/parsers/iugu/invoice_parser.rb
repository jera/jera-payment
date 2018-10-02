module JeraPayment
  module Parsers
    module Iugu
      class InvoiceParser
        def self.invoice_creation(resource)
          {
            email: resource.email,
            cc_emails: resource.cc_emails,
            due_date: resource.due_date,
            ensure_workday_due_date: resource.ensure_workday_due_date,
            items: resource.items,
            return_url: resource.return_url,
            expired_url: resource.expired_url,
            notification_url: resource.notification_url,
            fines: resource.fines,
            late_payment_fine: resource.late_payment_fine,
            per_day_interest: resource.per_day_interest,
            discount_cents: resource.discount_cents,
            customer_id: JeraPayment::Customer.find_by(id: resource.customer_id)&.api_id,
            ignore_due_email: resource.ignore_due_email,
            subscription_id: resource.subscription_api_id,
            payable_with: resource.payable_with,
            credits: resource.credits,
            early_payment_discount: resource.early_payment_discount,
            early_payment_discounts: resource.early_payment_discounts,
            payer: {
              cpf_cnpj: resource.cpf_cnpj,
              name: resource.name,
              phone_prefix: resource.phone_prefix,
              phone: resource.phone,
              email: resource.email,
              address: {
                zip_code: resource.zip_code,
                street: resource.street,
                number: resource.number,
                neighborhood: resource.neighborhood,
                city: resource.city,
                state: resource.state,
                country: resource.country,
                complement: resource.complement
              },
            },
          }
        end
      end
    end
  end
end
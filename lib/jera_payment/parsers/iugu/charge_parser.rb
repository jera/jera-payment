module JeraPayment
  module Parsers
    module Iugu
      class ChargeParser
        def self.charge_body(resource)
          {
            invoice_id: resource&.invoice&.api_id,
            customer_payment_method_id: resource.customer_payment_method_api_id,
            restrict_payment_method: resource.restrict_payment_method,
            customer_id: resource.customer_api_id,
            email: resource.email,
            months: resource.months,
            discount_cents: resource.discount_cents,
            bank_slip_extra_days: resource.bank_slip_extra_days,
            keep_dunning: resource.keep_dunning,
            items: resource.items,
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
module JeraPayment
  module Services
    module Iugu
      module Invoices
        class Create < JeraPayment::Services::Iugu::Base
          def call
            iugu_invoice = JeraPayment::Api::Iugu::Invoice.create(JeraPayment::Parsers::Iugu::InvoiceParser.invoice_creation(@resource),
                                                                  @resource&.sub_account&.api_token)

            if iugu_invoice[:errors].present?
              add_error(iugu_invoice[:errors])
            else
              set_api_attributes(iugu_invoice)
            end

            @resource.errors.blank?
          end

          private
          def set_api_attributes(attributes)
            byebug
            @resource.api_id = attributes[:id]
            @resource.assign_attributes(attributes.slice(:total_cents, :secure_url, :items)
                                                         .merge( { digitable_line: attributes[:bank_slip][:digitable_line],
                                                                   barcode_data: attributes[:bank_slip][:barcode_data],
                                                                   barcode: attributes[:bank_slip][:barcode] } ) )
          end
        end
      end
    end
  end
end
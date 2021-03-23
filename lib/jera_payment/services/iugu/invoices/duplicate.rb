module JeraPayment
  module Services
    module Iugu
      module Invoices
        class Duplicate < JeraPayment::Services::Iugu::Base
          def initialize(resource, attributes)
            @resource = resource
            @attributes = attributes
          end

          def call
            begin
              ApplicationRecord.transaction do
                iugu_invoice_duplicated = JeraPayment::Api::Iugu::Invoice.duplicate(@resource.api_id, @attributes,
                                                                                    @resource&.sub_account&.api_token)

                raise(StandardError, iugu_invoice_duplicated[:errors]) if iugu_invoice_duplicated[:errors].present?

                invoice_duplicated = set_new_invoice(iugu_invoice_duplicated)

                raise(StandardError, invoice_duplicated[:errors]) if invoice_duplicated[:errors].present?

                @resource = invoice_duplicated
              end
            rescue Exception => error
              add_error(error.message)
            end
            @resource
          end

          private

          def set_new_invoice(iugu_invoice_duplicated)
            invoice_duplicated = JeraPayment::Invoice.new(@resource.attributes.except('id', 'api_id'))

            invoice_duplicated.api_id = iugu_invoice_duplicated[:id]

            invoice_duplicated.assign_attributes(iugu_invoice_duplicated.slice(:total_cents, :secure_url, :items, :ignore_due_email,
                                                                               :ignore_canceled_email, :current_fines_option,
                                                                               :keep_early_payment_discount, :due_date))

            invoice_duplicated.assign_attributes(iugu_invoice_duplicated.dig(:bank_slip).slice(:digitable_line, :barcode_data, :barcode))

            invoice_duplicated.duplicated = true

            invoice_duplicated.save

            invoice_duplicated
          end

        end
      end
    end
  end
end

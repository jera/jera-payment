module JeraPayment
  module Concerns
    module InvoiceMethods
      extend ActiveSupport::Concern

      included do
        def cancel
          JeraPayment::Services::Iugu::Invoices::UpdateStatus.new(self, :cancel).call
        end

        def capture
          JeraPayment::Services::Iugu::Invoices::UpdateStatus.new(self, :capture).call
        end

        def refund
          JeraPayment::Services::Iugu::Invoices::UpdateStatus.new(self, :refund).call
        end

        def duplicate(attibutes = {})
          JeraPayment::Services::Iugu::Invoices::Duplicate.new(self, attributes).call
        end

        def send_email
          JeraPayment::Services::Iugu::Invoices::SendEmail.new(self).call
        end

        def has_update_callback?
          false
        end

        def has_destroy_callback?
          false
        end

        def has_create_callback?
          !self.duplicated
        end

        def items=(value)
          write_attribute(:items, value&.to_json)
        end

        def items
          ActiveSupport::JSON.decode(self[:items]).map{ |item| item.deep_symbolize_keys } if self[:items]
        end

        def early_payment_discounts=(value)
          write_attribute(:items, value&.to_json)
        end

        def early_payment_discounts
          ActiveSupport::JSON.decode(self[:early_payment_discounts]).map{ |early_payment_discount| early_payment_discount.deep_symbolize_keys } if self[:early_payment_discounts]
        end
      end

    end
  end
end
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
      end

    end
  end
end
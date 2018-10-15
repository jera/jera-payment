module JeraPayment
  module Parsers
    module Iugu
      class SubAccountParser
        def self.parse_account_configuration(resource)
          {
            comissions: resource.comissions,
            auto_withdraw: resource.auto_withdraw,
            fines: resource.fines,
            per_day_interest: resource.per_day_interest,
            late_payment_fine: resource.late_payment_fine,
            auto_advance: resource.auto_advance,
            auto_advance_type: resource.auto_advance_type,
            auto_advance_option: resource.auto_advance_option,
            bank_slip: resource.bank_slip,
            credit_card: resource.credit_card,
            payment_email_notification: resource.payment_email_notification,
            payment_email_notification_receiver: resource.payment_email_notification_receiver,
            early_payment_discount: resource.early_payment_discount,
            early_payment_discounts: resource.early_payment_discounts
          }
        end
      end
    end
  end
end
module JeraPayment
  module Parsers
    module Iugu
      class CreditCardParser
        def self.parse_payment_token(resource)
          {
            account_id: resource&.customer&.sub_account&.present? ? resource&.customer&.sub_account&.account_id : JeraPayment.account_id,
            method: 'credit_card',
            test: resource.test,
            data: {
              number: resource.number,
              verification_value: resource.cvv,
              first_name: resource.first_name,
              last_name: resource.last_name,
              month: resource.month,
              year: resource.year
            }
          }
        end
        def self.parse_payment_method(resource, credit_card_token_id)
          {
            token: credit_card_token_id,
            description: resource.description,
            set_as_default: 'false'
          }
        end
      end
    end
  end
end


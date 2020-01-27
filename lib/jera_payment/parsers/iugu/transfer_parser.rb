module JeraPayment
  module Parsers
    module Iugu
      class TransferParser
        def self.parse_creation(resource)
          {
            receiver_id: resource.receiver.api_id,
            amount_cents: resource.amount_cents,
            custom_variables: resource.custom_variables
          }
        end
      end
    end
  end
end
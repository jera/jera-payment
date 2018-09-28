module JeraPayment
  module Concerns
    module SubAccountMethods
      extend ActiveSupport::Concern

      included do
        def api_token
          JeraPayment.is_test ? 'test_api_token' : 'live_api_token'
        end

        def has_destroy_callback?
          false
        end

        def comissions=(value)
          write_attribute(:comissions, value&.to_json)
        end

        def comissions
          ActiveSupport::JSON.decode(self[:comissions]).map{ |item| item.deep_symbolize_keys } if self[:comissions]
        end

        def bank_slip=(value)
          write_attribute(:items, value&.to_json)
        end

        def bank_slip
          ActiveSupport::JSON.decode(self[:bank_slip]).map{ |early_payment_discount| early_payment_discount.deep_symbolize_keys } if self[:bank_slip]
        end

        def credit_card=(value)
          write_attribute(:items, value&.to_json)
        end

        def credit_card
          ActiveSupport::JSON.decode(self[:credit_card]).map{ |early_payment_discount| early_payment_discount.deep_symbolize_keys } if self[:credit_card]
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
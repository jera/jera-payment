module JeraPayment
  module Parsers
    module Iugu
      class HouseholdParser
        def self.create_household(household)
          {
            agency: household.agency,
            account: household.account,
            account_type: household.account_type.checking? ? 'cc' : 'cp',
            bank: household.bank_iugu_code
          }
        end
      end
    end
  end
end
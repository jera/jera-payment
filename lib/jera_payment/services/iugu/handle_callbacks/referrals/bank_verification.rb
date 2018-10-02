module Iugu
  module HandleCallbacks
    module Referrals
      class BankVerification < Iugu::HandleCallbacks::Referrals::Base
        def call
          super
          
          @sub_account = SubAccount.find_by(account_id: @params["data"]["account_id"])

          return 404 unless @sub_account.present?

          if @params["data"]["status"] == "accepted"
            change_current_household
          else
            delete_household(@sub_account.households.last)
          end

          return 200
        end

        private

        def change_current_household
          last_household = @sub_account.households.last
          first_household = @sub_account.households.first

          @sub_account.update(current_household: last_household)

          delete_household(first_household)
        end

        def delete_household(household)
          household.destroy
        end

      end
    end
  end
end

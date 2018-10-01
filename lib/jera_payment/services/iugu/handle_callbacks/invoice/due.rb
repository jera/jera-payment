module Iugu
  module HandleCallbacks
    module Invoice
      class Due < Iugu::HandleCallbacks::Invoice::Base
        def initialize(params)
          super
        end

        def call
          super
        end

      end
    end
  end
end

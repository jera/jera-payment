module Iugu
  module HandleCallbacks
    module Invoice
      class Released < Iugu::HandleCallbacks::Invoice::Base
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

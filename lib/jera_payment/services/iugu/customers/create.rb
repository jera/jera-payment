module JeraPayment
  module Services
    class Iugu::Customers::Create
      def initialize(attributes)
        @attributes = attributes
      end

      def call
        iugu_customer = JeraPayment::Api::Iugu::Customer.create(self.attributes)

        if iugu_customer[:errors].present?
          # iugu_customer[:errors].map{ |error| self.errors.messages.merge(error) }
          # return false
        end

      end

    end
  end
end
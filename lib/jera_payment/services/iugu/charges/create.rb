module JeraPayment
  module Services
    module Iugu
      module Charges
        class Create < JeraPayment::Services::Iugu::Base
          def initialize(resource)
            super
          end

          def call
            charge_body = JeraPayment::Parsers::Iugu::ChargeParser.charge_body(@resource)
            charge_body.merge!({ method: @resource.method}) if @resource.method.present?
            charge_body.merge!({ token: @resource.token}) if @resource.token.present?

            iugu_charge = JeraPayment::Api::Iugu::Charge.create(charge_body)

            if iugu_charge[:errors].present?
              add_error(iugu_charge[:errors])
            else
              set_api_attributes(iugu_charge)
            end

            @resource.errors.blank?
          end

          private
          def set_api_attributes(attributes)
            @resource.assign_attributes(attributes.slice(:url, :pdf, :identification))
          end
        end
      end
    end
  end
end
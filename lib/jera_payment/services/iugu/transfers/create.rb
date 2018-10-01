module JeraPayment
  module Services
    module Iugu
      module Transfer
        class Create < JeraPayment::Services::Iugu::Base
          def initialize(resource)
            super
          end

          def call
            transfer_body = JeraPayment::Parsers::Iugu::TransferParser.parse_creation(@resource)
            iugu_transfer = eval("JeraPayment::Api::Iugu::Transfer.create(transfer_body, @resource&.sub_account&.api_token)")

            if iugu_transfer[:errors].present?
              add_error(iugu_transfer[:errors])
            else
              set_api_attributes(iugu_transfer)
            end

            @resource.errors.blank?
          end

          private
          def set_api_attributes(attributes)
            @resource.api_id = attributes[:id]
            @resource.assign_attributes(attributes.slice(:amount_localized))
          end
        end
      end
    end
  end
end
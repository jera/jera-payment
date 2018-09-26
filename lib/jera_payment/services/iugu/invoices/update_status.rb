module JeraPayment
  module Services
    module Iugu
      module Invoices
        class UpdateStatus < JeraPayment::Services::Iugu::Base
          def initialize(resource, method)
            @resource = resource
            @method = method
          end

          def call
            begin
              ApplicationRecord.transaction do
                status_update = eval("JeraPayment::Api::Iugu::Invoice.#{@method.to_s}(@resource.api_id)")
                raise status_update[:errors] if status_update[:errors].present?
              end
            rescue Exception => error
              add_error(error.message)
            end
            @resource
          end
        end
      end
    end
  end
end
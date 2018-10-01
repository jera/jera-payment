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
                status_update = eval("JeraPayment::Api::Iugu::Invoice.#{@method.to_s}(@resource.api_id,
                                                                                      @resource&.customer&.sub_account&.api_token)")
                if status_update[:errors].present?
                  raise(StandardError, status_update[:errors])
                else
                  @resource.update_columns(status: status_update[:status])
                end
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
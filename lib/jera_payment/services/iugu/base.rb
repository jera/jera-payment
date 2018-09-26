module JeraPayment
  module Services
    module Iugu
      class Base
        def initialize(resource)
          @resource = resource
          @attributes = @resource.attributes
        end

        private
        def add_error(errors)
          if errors.is_a?(Hash)
            errors.each{ |key, error| @resource.errors.messages.merge!( { "#{key}": error } ) }
          elsif errors.is_a?(String)
            @resource.errors.add(:base, errors)
          elsif errors.is_a?(Array)
            errors.each{ |error| @resource.errors.add(:base, error) }
          end
        end
      end
    end
  end
end

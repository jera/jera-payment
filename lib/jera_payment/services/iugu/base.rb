module JeraPayment
  module Services
    module Iugu
      class Base
        def initialize(resource, attributes = nil)
          @resource = resource
          @attributes = attributes
        end

        private
        def add_error(errors)
          errors.each{ |key, error| @resource.errors.messages.merge!( { "#{key}": error } ) }
        end
      end
    end
  end
end

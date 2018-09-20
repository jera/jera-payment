module JeraPayment
  module Services
    module Iugu
      class Base
        def self.add_error(resource, errors)
          errors.each{ |key, error| resource.errors.messages.merge!( { "#{key}": error } ) }
        end
      end
    end
  end
end

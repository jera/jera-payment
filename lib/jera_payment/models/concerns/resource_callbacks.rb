module JeraPayment
  module Concerns
    module ResourceCallbacks
      extend ActiveSupport::Concern

      included do
        before_create -> { api_action(:create) }, if: :has_create_callback?
        before_update -> { api_action(:update) }, if: :has_update_callback?
        before_destroy -> { api_action(:destroy) }, if: :has_destroy_callback?
      end

      def api_action(action_name)
        api_response = eval("JeraPayment::Services::#{api_name}::#{module_name}::#{action_name.to_s.capitalize}.new(self).call")
        throw(:abort) unless api_response
      end

      def has_update_callback?
        true
      end

      def has_create_callback?
        true
      end

      def has_destroy_callback?
        true
      end

      private
      def module_name
        self.class.name.pluralize.split('::').last
      end

      def api_name
        JeraPayment.api.to_s.capitalize
      end

    end
  end
end
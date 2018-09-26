module JeraPayment
  class CallbacksController < JeraPaymentController
    def callback
      status = eval("::JeraPayment::Services::#{api_name}::HandleCallbacks::#{format_event(params[:event])}.new(#{params}).call")

      render json: { status: status }, status: status
    end

    private
    def api_name
      JeraPayment.api.to_s.capitalize
    end

    def format_event(event)
      resource = event.split('.').first.capitalize

      event = event.split('.').last.split('_').map{|w| w.capitalize}.join

      resource + "::" + event
    end
  end
end
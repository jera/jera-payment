module JeraPayment
  class JeraPaymentController < ::ApplicationController
    protect_from_forgery unless: -> { request.format.json? }
  end
end
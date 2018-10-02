#this is the intilizer
#here you will set up the jera payment configuration
JeraPayment.setup do |config|

  config.api = YOUR_API # :pagar_me, :iugu, :mercado_pago
  config.api_key = YOUR_API_KEY
  config.api_key_test = YOUR_API_TEST_KEY
  config.account_id = YOUR_API_ACCOUNT_ID
  config.is_test = TRUE_OR_FALSE

end

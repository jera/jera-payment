#this is the intilizer
#here you will set up the jera payment configuration
JeraPayment.setup do |config|
  config.api = 'YOUR_API' # :pagar_me, :iugu, :mercado_pago
  config.api_key = 'YOUR_PRODUCTION_API_KEY' # string
  config.api_key_test = 'YOUR_DEVELOPMENT_API_KEY' # string
  config.account_id = 'YOUR_API_ACCOUNT_ID' # string
  config.is_test = 'TRUE_OF_FALSE' # boolean
end
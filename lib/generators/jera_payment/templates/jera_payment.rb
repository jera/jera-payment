#this is the intilizer
#here you will set up the jera push configuration
JeraPayment.setup do |config|

  config.api = "SERVICE_YOU_SE" # pagarme, iugu, mercadopago
  config.api_key = "YOUR_API_KEY"
  config.api_key_test = "YOUR_API_KEY_TEST"
  config.account_id = "YOUR_ACCOUNT_ID"
  config.is_test = "TRUE_FALSE"

end

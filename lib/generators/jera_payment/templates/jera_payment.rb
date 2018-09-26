#this is the intilizer
#here you will set up the jera payment configuration
JeraPayment.setup do |config|

  config.api = :iugu # :pagar_me, :iugu, :mercado_pago
  config.api_key = "f273476d60870c81a958471808b38ff2"
  config.api_key_test = "f273476d60870c81a958471808b38ff2"
  config.account_id = "5FEFF69987A44DB5B3DBB7C75F6EA1D6"
  config.is_test = true

end

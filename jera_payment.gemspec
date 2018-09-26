$:.push File.expand_path("../lib", __FILE__)

require "jera_payment/version"

Gem::Specification.new do |spec|
  spec.name          = "jera_payment"
  spec.version       = JeraPayment::VERSION
  spec.required_ruby_version = '>= 2.5.0'
  spec.authors       = ["Jera"]
  spec.homepage      = "https://github.com/jera/jera-payment"
  spec.email         = ["hospedagem@jera.com.br"]
  spec.summary       = "Gem to use Pagar.me, MercadoPago and Iugu Payment API's."
  spec.description   = "This gem consume the API's and integrate with your's project DB."
  spec.license       = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  spec.test_files = Dir["test/**/*"]

  spec.add_dependency 'rails', '~> 5.2'
  spec.add_dependency 'enumerize', '~> 2.0'
  spec.add_dependency 'httparty', '~> 0.16'
  spec.add_dependency 'rails_admin', '~> 1.3'

  spec.add_development_dependency 'sqlite3', '~> 1.3'
end

class JeraPayment::Household < ActiveRecord::Base
  require 'enumerize'

  include JeraPayment::Concerns::ResourceCallbacks
  include JeraPayment::Concerns::HouseholdMethods
  extend Enumerize

  attr_readonly :sub_account, :agency, :account, :account_type, :bank, :document

  self.table_name = 'jera_payment_households'

  belongs_to :sub_account, class_name: 'JeraPayment::SubAccount'

  enumerize :status, in: { pending: 0, rejected: 2, accepted: 3 }, predicates: true, scope: true, default: :pending
  enumerize :bank, in: { itau: 0, bradesco: 1, caixa_economica: 2, banco_do_brasil: 3, santander: 4, banrisul: 5, sicredi: 6, sicoob: 7, inter: 8, brb: 9 }
  enumerize :account_type, in: { checking: 0, savings: 1 }

  def self.bank_to_enumerize(bank_name)
    bank_name.parameterize.underscore.to_sym
  end

  def self.account_type_to_enumerize(account_type)
    account_type.eql?('Corrente') ? :checking : :savings
  end

  def bank_iugu_code
    case self.bank
    when "banco_do_brasil"
      "001"
    when "itau"
      "341"
    when "bradesco"
      "237"
    when "caixa_economica"
      "104"
    when "banrisul"
      "041"
    when "sicredi"
      "748"
    when "brb"
      "070"
    when "santander"
      "033"
    when "sicoob"
      "756"
    when "inter"
      "077"
    end
  end

end
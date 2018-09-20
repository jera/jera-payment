require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class JeraPaymentGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def create_customers_table
        migration_template "create_jera_payment_customers.rb", "db/migrate/create_jera_payment_customers.rb"
      end

    end
  end
end

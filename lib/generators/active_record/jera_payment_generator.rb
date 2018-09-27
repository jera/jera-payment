require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class JeraPaymentGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def create_customers_table
        migration_template "create_jera_payment_customers.rb", "db/migrate/create_jera_payment_customers.rb", migration_version: migration_version
      end

      def create_credit_cards_table
        migration_template "create_jera_payment_credit_cards.rb", "db/migrate/create_jera_payment_credit_cards.rb", migration_version: migration_version
      end

      def create_invoices_table
        migration_template "create_jera_payment_invoices.rb", "db/migrate/create_jera_payment_invoices.rb", migration_version: migration_version
      end

      def create_charges_table
        migration_template "create_jera_payment_charges.rb", "db/migrate/create_jera_payment_charges.rb", migration_version: migration_version
      end

      def create_plans_table
        migration_template "create_jera_payment_plans.rb", "db/migrate/create_jera_payment_plans.rb", migration_version: migration_version
      end

      def rails5?
        Rails.version.start_with? '5'
      end

      def migration_version
       if rails5?
         "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
       end
     end

    end
  end
end

require 'rails/generators/base'

module JeraPayment
  module Generators

    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def initializer_file
        template 'jera_payment.rb', 'config/initializers/jera_payment.rb'
      end

      def locale_file
        copy_file '../../../../config/locale/jera_payment.pt-BR.yml', 'config/locales/jera_payment.pt-BR.yml'
      end

      def generate_migrations
        case self.behavior
        when :invoke
          generate "active_record:jera_payment", "migration"
        when :revoke
          Rails::Generators.invoke "active_record:jera_payment", ["migration"], behavior: :revoke
        end
      end

      def callback_services
        copy_subscription_files
        copy_invoice_files
        copy_sub_account_files
        copy_withdrawal_files
      end

      private
      def copy_subscription_files
        files = ['base', 'activated', 'changed', 'created', 'expired', 'renewed', 'suspended']

        files.each do |file|
          copy_file "../../../jera_payment/services/iugu/handle_callbacks/subscription/#{file}.rb", "app/services/iugu/handle_callbacks/subscription/#{file}.rb"
        end
      end

      def copy_invoice_files
        files = ['base', 'created', 'due', 'dunning_action', 'installment_released', 'payment_failed', 'refund', 'released', 'status_changed']

        files.each do |file|
          copy_file "../../../jera_payment/services/iugu/handle_callbacks/invoice/#{file}.rb", "app/services/iugu/handle_callbacks/invoice/#{file}.rb"
        end
      end

      def copy_sub_account_files
        files = ['base', 'verification']

        files.each do |file|
          copy_file "../../../jera_payment/services/iugu/handle_callbacks/referrals/#{file}.rb", "app/services/iugu/handle_callbacks/referrals/#{file}.rb"
        end
      end

      def copy_withdrawal_files
        files = ['base', 'created', 'status_changed']

        files.each do |file|
          copy_file "../../../jera_payment/services/iugu/handle_callbacks/withdraw_request/#{file}.rb", "app/services/iugu/handle_callbacks/withdraw_request/#{file}.rb"
        end
      end

    end
  end
end

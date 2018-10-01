class JeraPaymentGenerator < Rails::Generators::NamedBase
  desc "This generator creates an initializer file at config/initializers"
  source_root File.expand_path("../templates", __FILE__)

  MissingModel = Class.new(Thor::Error)

  def initializer_file
    template 'jera_payment.rb', 'config/initializers/jera_payment.rb'
  end

  def locale_file
    copy_file '../../../../config/locale/jera_payment.pt-BR.yml', 'config/locales/jera_payment.pt-BR.yml'
  end

  def callback_services
    copy_subscription_files
    copy_invoice_files
  end

  def generate_migrations
		unless model_exists?
			raise MissingModel,
				"\n\tModel \"#{file_name.titlecase}\" doesn't exists. Please, create your Model and try again."
		end

    inject_into_file model_path, "\n\thas_one :customer, as: :customerable, class_name: 'JeraPayment::Customer'", after: '< ActiveRecord::Base'

    inject_into_file model_path, "\n\thas_one :customer, as: :customerable, class_name: 'JeraPayment::Customer'", after: '< ApplicationRecord'

    case self.behavior
    when :invoke
      generate "active_record:jera_payment", file_name
    when :revoke
      Rails::Generators.invoke "active_record:jera_payment", [file_name], behavior: :revoke
    end
  end

  private

  	def model_exists?
  		File.exist?(File.join(destination_root, model_path))
  	end

	  def model_path
		  @model_path ||= File.join("app", "models", "#{file_path}.rb")
		end

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
end

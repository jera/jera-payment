class JeraPaymentGenerator < Rails::Generators::NamedBase
  desc "This generator creates an initializer file at config/initializers"
  source_root File.expand_path("../templates", __FILE__)

  MissingModel = Class.new(Thor::Error)

  def generate_relation
    unless model_exists?
      raise MissingModel,
      "\n\tModel \"#{file_name.titlecase}\" doesn't exists. Please, create your Model and try again."
    end

    unless args.present?
      raise MissingModel,
      "\n\tYou need to pass an JeraPayment Model (Customer or/and SubAccount)"
    end

    args.each do |arg|
      inject_into_file model_path, "\n\thas_one :#{arg.underscore}, as: :#{polymorfic_model_name(arg)}, class_name: 'JeraPayment::#{arg}'", after: '< ActiveRecord::Base'

      inject_into_file model_path, "\n\thas_one :#{arg.underscore}, as: :#{polymorfic_model_name(arg)}, class_name: 'JeraPayment::#{arg}'", after: '< ApplicationRecord'
    end

  end

  private

	def model_exists?
		File.exist?(File.join(destination_root, model_path))
	end

  def model_path
	  @model_path ||= File.join("app", "models", "#{file_path}.rb")
	end

  def polymorfic_model_name(arg)
    case arg
    when "Customer"
      return "customerable"
    when "SubAccount"
      return "sub_accountable"
    end

    raise MissingModel, "\n\tJera Payment Model \"#{arg}\" doesn't exists. Available models: Customer and SubAccount"
  end
end


















<<<<<<< HEAD
=======
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
>>>>>>> develop

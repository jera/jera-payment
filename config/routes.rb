Rails.application.routes.draw do
  namespace :jera_payment do
    post 'callback', action: :callback, controller: 'callbacks'
  end
end

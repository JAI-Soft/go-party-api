Rails.application.routes.draw do
  # Rutas para Active Admin utilizando el scope 'admin'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Rutas para la API utilizando el scope 'api'
  devise_for :users, skip: :all
  namespace :api do
    namespace :v1, defaults: {format: :json} do
      get :status, to: "api#status"

      devise_scope :user do
        post "register", to: "registrations#create"
        post "login", to: "sessions#create"
        #post "/forgot_password", to: "passwords#forgot"
        #put "/reset_password", to: "passwords#reset"
        resources :users
      end
    end
  end

  # Resto de tus rutas...
end

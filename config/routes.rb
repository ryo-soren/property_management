Rails.application.routes.draw do
  root "properties#index"

  resource :session, only:[:new, :create, :destroy]

  resources :users, only: [:new, :create]

  get "admin_panel", to: "users#admin_panel" 
  get "customer_panel", to: "users#customer_panel"

  resources :properties do
    resources :applications, only: [:new, :create, :index, :show, :update]
    resources :questions, only: [:create, :destroy] do
      resources :answers, only: [:create] do
      end
    end

  end
end

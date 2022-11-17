Rails.application.routes.draw do
  root "properties#index"

  resource :session, only:[:new, :create, :destroy]

  resources :users, only: [:new, :create] do
    get "admin_panel", to: "users#admin_panel"
  end
  
  resources :properties do
    resources :questions, only:[:create, :destroy] do
      resources :answers, only: [:create] do
      end
    end
  end






end

Rails.application.routes.draw do
  root "properties#index"

  resource :session, only:[:new, :create, :destroy]

  resources :users, except: [:edit, :update, :destroy]

  resources :properties do
    resources :questions do
      resources :answers do
      end
    end
  end

end

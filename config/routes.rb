Rails.application.routes.draw do
  resources :users do
  end

  resource :sessions, only: :create

  resources :tasks do
    collection do
     post :batch_destroy
    end
  end
end

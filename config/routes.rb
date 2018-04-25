Rails.application.routes.draw do
  get 'email_confirmation/show'

  resources :users do
  #, only: [:create, :email_confirmation]
    collection do
      post :email_confirmation
    end
  end

  resource :sessions, only: :create

  resources :tasks do
    collection do
     post :batch_destroy
    end
  end
end

Rails.application.routes.draw do
  resources :tasks do
    collection do
     post :batch_destroy
    end
  end
end

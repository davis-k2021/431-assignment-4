Rails.application.routes.draw do

  root :to => 'books#index'

  resources :books do
    member do
      get :delete
    end
  end
end

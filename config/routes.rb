Rails.application.routes.draw do

  
  devise_for :users

  root 'home#index'

  resources :rooms do
    member do
      get :join
    end
  end
end

Rails.application.routes.draw do
  resources :profiles
  resources :cities, only: [:province] do 
    member do 
      get 'province'
    end
  end

  devise_for :users, controllers: {registrations: "registrations"}

  devise_scope :user do
    post '/users/sign_out', to: 'devise/sessions#destroy'
  end

  
  root "home#index"
end

Rails.application.routes.draw do

  resources :users
  resource :session, only: [:new, :create, :destroy]

  get '/users/current', to: 'users#current'

  root 'static#index'
  
end

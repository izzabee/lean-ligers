Rails.application.routes.draw do

  resources :messages

  resources :users
  resource :session, only: [:new, :create, :destroy]

  get '/login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/users/current', to: 'users#current'

  root 'static#index'
  
end

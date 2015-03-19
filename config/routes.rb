Rails.application.routes.draw do


  resources :messages
  resources :users 
  resources :mentees, controller: 'users', type: 'Mentee' 
  
  resources :mentors, controller: 'users', type: 'Mentor' do 
    resources :mentorships, only: [:new, :create, :destroy, :update]
  end

  resources :user_questions, only: [:new, :create, :destroy, :update]
  resource :session, only: [:new, :create, :destroy]

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/users/current', to: 'users#current'
  get '/homepage', to: 'users#homepage'

  root 'static#index'

end
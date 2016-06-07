Rails.application.routes.draw do
  # get 'index', to: 'users#index'
  # get 'signup', to: 'users#new'
  # root 'users#index'
  root 'shoes#index'
  resources :users

  resources :sessions
  get '/login', to: 'sessions#new'
  get '/logout', to: 'users#index'

  resources :shoes

end

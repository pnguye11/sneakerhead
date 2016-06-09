Rails.application.routes.draw do
  root 'static_pages#index'

  resources :users, except: :index do
    resources :shoes, except: :index
  end

  resources :shoes, only: :index

  resources :sessions, only: [:new, :create ,:destroy]
  get '/login', to: 'sessions#new'


end

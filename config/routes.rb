Rails.application.routes.draw do
  root 'static_pages#index'
  resources :shoes
  resources :users



  resources :sessions, only: [:create]
  get '/login', to: "sessions#new"
  delete '/logout', to: "sessions#destroy"
end

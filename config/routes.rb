Rails.application.routes.draw do
  root 'static_pages#index'
  resources :shoes
  resources :users

  resource :shoes do
    member do
      post '/like' => 'shoes#like'
    end
  end

  resources :sessions, only: [:create]
  get '/login', to: "sessions#new"
  delete '/logout', to: "sessions#destroy"
end

Rails.application.routes.draw do
  get 'index', to: 'users#index'
  # resources :user, only: [:new, :create]
end

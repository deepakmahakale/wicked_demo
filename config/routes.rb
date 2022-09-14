Rails.application.routes.draw do
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout'

  resources :home, only: :index
  resources :onboarding

  root to: 'home#index'
end

Rails.application.routes.draw do
  resources :home, only: :index
  resources :onboarding

  root to: 'home#index'
end

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'about', to: 'home#about'

  resources :ai_stories

  root "home#index"
end

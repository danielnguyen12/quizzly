Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'about', to: 'home#about'

  resources :quizzes
  get 'quizzes', to: 'quizzes#index', as: :user_root
  # resources :ai_stories

  root "home#index"
end

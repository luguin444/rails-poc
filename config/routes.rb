Rails.application.routes.draw do
  get "up", to: "rails/health#show", as: :rails_health_check
  get "health", to: "health#index", as: :health_check

  post 'tweets', to: 'tweet#create', as: :tweet_create
  post 'users', to: 'user#create', as: :user_create
end

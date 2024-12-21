Rails.application.routes.draw do
  get "up", to: "rails/health#show", as: :rails_health_check
  get "health", to: "health#index", as: :health_check

  #tweets
  post 'tweets', to: 'tweet#create', as: :tweet_create
  get 'tweets', to: 'tweet#index', as: :get_tweets

  #users
  post 'users', to: 'user#create', as: :user_create
end

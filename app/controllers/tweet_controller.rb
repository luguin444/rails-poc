class TweetController < ApplicationController
  before_action :validate_params!, only: [:create]

  def create
    message = request.params['message']
    user_id = request.params['user_id']

    user = User.find_by(id: user_id)
    return render json: { error: "User not found" }, status: :not_found unless user

    tweet = Tweet.create!(message: message, user: user)

    render json: { tweet: tweet }, status: :created
  end

  def index 
    last_tweets = Tweet.order(created_at: :desc).limit(10).joins(:user).select('tweets.id, tweets.message, users.name as user_name')

    render json: { tweets: last_tweets }
  end

  private

  def validate_params!
    param! :message, String, required: true, message: "Message attribute is missing or invalid."
    param! :user_id, Integer, required: true, message: "User_id attribute is missing or invalid."
  rescue => e
    raise Request::BadRequestError.new(e.message)
  end
end
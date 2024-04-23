class TweetController < ApplicationController
  before_action :validate_params!

  def create
    message = request.params['message']

    tweet = Tweet.create!(message: message)

    render json: { tweet: tweet }, status: :created
  end

  private

  def validate_params!
    param! :message, String, required: true, message: "Message attribute is missing or invalid."
  rescue => e
    raise Request::BadRequestError.new(e.message)
  end
end
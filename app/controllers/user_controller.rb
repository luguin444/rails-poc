class UserController < ApplicationController
  before_action :validate_params!

  def create 
    name = request.params['name']
    age = request.params['age']
    is_admin = request.params['is_admin'] || false

    user = User.create!(name: name, age: age, is_admin: is_admin)

    render json: { user: user }, status: :created
  end

  private 

  def validate_params!
    param! :name, String, required: true, message: "Name attribute is missing or invalid."
    param! :age, String, required: true, message: "Age attribute is missing or invalid."
    param! :is_admin, :boolean, required: false, message: "Is_admin attribute is invalid."
  rescue => e
    puts(e.message)
    raise Request::BadRequestError.new(e.message)
  end
end
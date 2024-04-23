class Request::BadRequestError < Request::HttpBaseError
  def initialize(message)
    super(422, message)
  end
end
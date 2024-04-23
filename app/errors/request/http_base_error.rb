class Request::HttpBaseError < StandardError
  attr_reader :message, :status # gera métodos de leitura para as variáveis de instância
  def initialize(status, message)
    @message = message
    @status = status
    super(message)
  end
end
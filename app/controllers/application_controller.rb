class ApplicationController < ActionController::API
  include ExceptionHandler
  include Response
  include UtilService
  before_action :authorize_request

  def authorize_request
    token = request.headers['Authorization']
    data_token = JsonWebToken.decode token
    @current_user = User.find(data_token[:user_id])
  end
end

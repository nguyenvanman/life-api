module AuthService::SignIn
  def self.call(sign_in_params)
    account = Account.find_by(email: sign_in_params[:email])
    raise(ExceptionHandler::AuthenticationError, 'asd') unless account    
  end
end
module AuthService::SignIn
  def self.call(sign_in_params)
    account = Account.find_by(email: sign_in_params[:email])
    raise(ExceptionHandler::AuthenticationError, 'email not found') unless account
    raise(ExceptionHandler::AuthenticationError, 'incorrect password') unless account.authenticate(sign_in_params[:password])
    return UtilService::TokenGenerator.call(account), account.user
  end
end
class AuthController < ApplicationController

  def sign_in
    AuthService::SignIn.call(sign_in_params)
  end

  def sign_in_params
    params.require(%i[email password])
    params.permit(:email, :password)
  end

end

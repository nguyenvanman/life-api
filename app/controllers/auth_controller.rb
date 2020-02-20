class AuthController < ApplicationController

  def sign_in
    token, user = AuthService::SignIn.call(sign_in_params)
    data = {
      token: token,
      user: UserSerializer.new(user)  
    }
    render_data data
  end

  def sign_in_params
    params.require(%i[email password])
    params.permit(:email, :password)
  end

end

module UserService::Create
  def self.call(sign_up_params)
    user = User.create!(sign_up_params.except(:email, :password))
    user.create_config
    user
  end
end
module UserService::Create
  def self.call(sign_up_params)
    User.create!(sign_up_params.except(:email, :password))
  end
end
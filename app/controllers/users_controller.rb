class UsersController < ApplicationController
  include UserService
  def update
    user = UserService::Update.call(@current_user, user_params)
    render_one user
  end

  def show
    render_one @current_user, UserDataSerializer
  end

  def index
    render_list User.all 
  end

  private

  def render_one(user, serializer_class = UserSerializer) 
    data = {
      user: serializer_class.new(user)
    }

    render_data data
  end

  def render_list users
    data = {
      users: users 
    }

    render_data data
  end

  def user_params
    params.require(%i[name phone address gender])
    params.permit(:name, :phone, :address, :gender, :image_url)
  end

end

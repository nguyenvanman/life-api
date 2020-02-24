class UsersController < ApplicationController
  include UserService
  def update
    user = UserService::Update.call(@current_user, user_params)
    render_one user
  end

  def show
    render_one User.find(params[:id]) 
  end

  def index
    render_list User.all 
  end

  private

  def render_one user
    data = {
      user: UserSerializer.new(user)
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
    params.permit(:name, :phone, :address,:gender)
  end

end

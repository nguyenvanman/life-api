class UsersController < ApplicationController
  def show
    render_one User.find(params[:id]) 
  end

  def index
    render_list User.all 
  end

  private

  def render_one user
    data = {
      user: user
    }

    render_data data
  end

  def render_list users
    data = {
      users: users 
    }

    render_data data
  end

end

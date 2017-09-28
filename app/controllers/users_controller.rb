class UsersController < ApplicationController
  def create
    user = User.new(username:params[:username], password:params[:password])
    if user.save
      render json:user
    else
    end
  end
end

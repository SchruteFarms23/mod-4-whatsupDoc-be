class AuthController < ApplicationController
  def create
    user= User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      payload = {user_id: user.id}
      token = JWT.encode(payload,"lebronjames")
      render json: {user:user, jwt:token}
    end
  end
end

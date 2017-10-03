class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create,:mydoctors,:update]

  def create

    user = User.new(username:params[:username], password:params[:password])
    if user.save
      token = encode_token({user_id: user.id})
      render json: {user:user, jwt: token}
    else
    end
  end

  def get_doctors
    @user_doctors = User.last
    render json: @user_doctors, status: 200
  end

  def me

    if @user
      render json: {user: @user, doctors: @user.doctors}
    else
      render json: {message:"Error"}
    end

  end

  def mydoctors
    @user = User.find_by(id: params[:id])
    @doctors = @user.doctors
    render json: @doctors
  end

  def update
    @user = User.find(params[:user_id])
    @doctor = Doctor.find(params[:doc_id])
    @user.doctors << @doctor
  end


end

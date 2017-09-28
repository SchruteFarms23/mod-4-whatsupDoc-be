class Api::V1::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: @doctors, status: 200
  end

  def create
    @doctor = Note.create(doctor_params)
    render json: @doctor, status: 201
  end

  private
  def doctor_params
    params.permit(:body)
  end

end
end

class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
    render json: @doctors, status:200



  end




end

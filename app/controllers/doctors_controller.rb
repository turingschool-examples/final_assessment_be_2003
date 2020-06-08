class DoctorsController < ApplicationController

  def new
    @hospital = Hospital.find(params[:hospital_id])
    @doctor = @hospital.doctors.new
  end

  def show
    @doctor = Doctor.find(params[:id])
  end
end

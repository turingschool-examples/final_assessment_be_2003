class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @hospital = Hospital.find(params[:id])
  end

  def create
    hospital = Hospital.find(params[:id])
    hospital.doctors.create!(doctor_params)
    redirect_to "/hospitals/#{hospital.id}"
  end

  def edit
    @doctor = Doctor.find(params[:id])
    @hospitals = Hospital.all
  end

  def update
    doctor = Doctor.find(params[:id])
    doctor.update(doctor_params)
    redirect_to "/doctors/#{doctor.id}"
  end

  private

  def doctor_params
    params.permit(:name, :specialty, :education, :hospital_id)
  end
end

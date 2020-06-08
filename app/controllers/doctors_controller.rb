class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @hospital = Hospital.find(params[:id])
  end

  def create
    hospital = Hospital.find(params[:id])
    doctor = hospital.doctors.create(doctor_params)
    doctor.save
    redirect_to hospital_path
  end

  private

  def doctor_params
    params.permit(:name, :specialty, :education)
  end
end
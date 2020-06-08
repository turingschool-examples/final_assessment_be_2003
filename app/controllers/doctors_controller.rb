class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @hospital = Hospital.find(params[:hospital_id])
    @doctor = Doctor.new
  end

  def create
    hospital = Hospital.find(params[:hospital_id])
    doctor = hospital.doctors.new(doctor_params)
    doctor.save
    redirect_to hospital_path(hospital)
  end

  private

  def doctor_params
  params.require(:doctor).permit(:name, :specialty, :university)
  end
end

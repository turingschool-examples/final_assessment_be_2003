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

  def update
    doctor = Doctor.find(params[:id])
    doctor.update(hospital_id: params[:doctor][:hospital_id])
    redirect_to doctor_path(doctor)
  end

  def reassign
    @doctor = Doctor.find(params[:id])
  end

  private

  def doctor_params
  params.require(:doctor).permit(:name, :specialty, :university)
  end
end

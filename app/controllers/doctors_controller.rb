class DoctorsController < ApplicationController

  def new
    @hospital = Hospital.find(params[:hospital_id])
  end

  def create
    hospital = Hospital.find(params[:hospital_id])
    doctor = hospital.doctors.create(doctor_params)
    redirect_to hospital_path(hospital)
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    doctor = Doctor.find(params[:id])
    # binding.pry
    doctor.update(doctor_params)
  end
  
  

  private

  def doctor_params
    params.permit(:name, :specialty, :education, :hospital_id)
  end


  
  
  
end
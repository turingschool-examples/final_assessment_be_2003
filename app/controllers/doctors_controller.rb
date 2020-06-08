class DoctorsController < ApplicationController

  def show 
    @doctor = Doctor.find(params[:id])
  end 

  def edit_hospital
    @doctor = Doctor.find(params[:doctor_id])
  end 

  def update_hospital
    doctor = Doctor.find(params[:doctor_id])
    new_hospital_id = params[:hospital_id]
    
    doctor.update(hospital_id: new_hospital_id)

    redirect_to doctor_path(doctor)
  end 
end
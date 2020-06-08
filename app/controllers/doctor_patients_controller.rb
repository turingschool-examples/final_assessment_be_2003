class DoctorPatientsController < ApplicationController

  def destroy
    doctor = Doctor.find(params[:doctor_id])
    DoctorPatient.destroy(params[:id])
    redirect_to doctor_path(doctor)
  end
  
end
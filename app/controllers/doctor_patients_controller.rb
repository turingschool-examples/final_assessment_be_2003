class DoctorPatientsController < ApplicationController

  def destroy
    dp = DoctorPatient.find_by(patient_id: params[:id], doctor_id: params[:doctor_id])
    dp.destroy
    redirect_to "/doctors/#{params[:doctor_id]}"
  end
  
end
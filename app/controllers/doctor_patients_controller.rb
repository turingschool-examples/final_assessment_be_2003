class DoctorPatientsController < ApplicationController

  def destroy
    relationship = DoctorPatient.find_by(patient_id: params[:patient_id], doctor_id: params[:doctor_id])
    relationship.destroy
    doctor_id = params[:doctor_id]
    redirect_to "/doctors/#{doctor_id}"
  end

end

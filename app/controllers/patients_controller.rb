class PatientsController < ApplicationController
  def destroy
    patient = Patient.find(params[:patient_id])
    patient.doctors.delete(params[:doctor_id])
    redirect_to "/doctors/#{params[:doctor_id]}"
  end
end
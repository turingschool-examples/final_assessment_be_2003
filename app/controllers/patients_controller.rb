class PatientsController < ApplicationController
  def destroy
    patient = Patient.find(params[:id])
    doctor_patient = DoctorPatient.where(params[:id])
    doctor_patient.delete
    redirect_to "/doctors/#{params[:doctor_id]}"
  end
end
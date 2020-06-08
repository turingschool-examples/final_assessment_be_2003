class PatientsController < ApplicationController
  def destroy
    # binding.pry
    patient = Patient.find(params[:patient_id])
    doctor_patient = DoctorPatient.where(params[:id])
    doctor_patient.delete_all
    redirect_to "/doctors/#{params[:doctor_id]}"
  end
end
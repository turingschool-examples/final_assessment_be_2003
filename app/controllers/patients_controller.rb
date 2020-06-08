class PatientsController < ApplicationController
  def destroy
    patient = Patient.find(params[:id])
    pet_doc = DoctorPatient.find(params[:id])
    pet_doc.delete
    redirect_to "/doctors/#{params[:doctor_id]}"
  end
end
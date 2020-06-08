class PatientsController < ApplicationController

  def destroy
    doctor = Doctor.find(params[:doc_id])
    Patient.destroy(params[:patient_id])
    redirect_to "/doctors/#{doctor.id}"
  end

end

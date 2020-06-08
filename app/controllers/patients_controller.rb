class PatientsController < ApplicationController
  def destroy
    doctor =  Doctor.find(params[:doctor_id])
    Patient.delete(params[:id])
    redirect_to "/doctors/#{doctor.id}"
  end
end

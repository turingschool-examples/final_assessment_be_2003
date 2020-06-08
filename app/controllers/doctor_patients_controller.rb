class DoctorPatientsController < ApplicationController

  def destroy
    Doctor.find(params[:doctor_id]).patients.destroy(params[:patient_id])
    redirect_to "/doctors/#{params[:doctor_id]}"
  end
end

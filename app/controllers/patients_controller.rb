class PatientsController < ApplicationController

  def index
    @hospital = Hospital.find(params[:hospital_id])
  end

  def destroy
    patient = Patient.find(params[:id])
    patient.doctor_patients.destroy_all
    Patient.destroy(params[:id])
    redirect_to "/doctors/#{params[:doctor_id]}"
  end
end

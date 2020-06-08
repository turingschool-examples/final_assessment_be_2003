class PatientsController < ApplicationController
  def index
    @hospital = Hospital.find(params[:hospital_id])
  end

  def destroy
    dr_patient = DoctorPatient.where("patient_id = #{params[:id]} AND
                                      doctor_id = #{params[:doctor_id]}").first
    dr_patient.destroy
    redirect_to doctor_path(params[:doctor_id])
  end
end

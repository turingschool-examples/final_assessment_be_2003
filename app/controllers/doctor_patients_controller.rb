class DoctorPatientsController < ApplicationController
  def destroy
    doctor_patient = DoctorPatient.find_by(doctor_id: params[:doctor_id], patient_id: params[:patient_id]).destroy

    redirect_to "/doctors/#{doctor_patient.doctor_id}"
  end
end

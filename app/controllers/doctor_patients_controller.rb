class DoctorPatientsController < ApplicationController

  def destroy
    patient = Patient.find(params[:id])
    dr = Doctor.find(params[:doctor_id])
     record = DoctorPatient.find_by(patient_id: params[:id], doctor_id: params[:doctor_id])
     record.destroy
  end
end

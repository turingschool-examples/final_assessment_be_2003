class DoctorPatientsController < ApplicationController

  def destroy
    patient = Patient.find(params[:id])
    DoctorPatient.where(patient_id: patient.id ).destroy_all
  end
end

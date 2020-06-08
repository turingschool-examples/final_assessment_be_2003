class DoctorPatientsController < ApplicationController

  def destroy
    doctor_patient = DoctorPatient.find(params[:id])
    doctor_patient.destroy
    redirect_to doctor_path(doctor_patient.doctor_id)
  end

end

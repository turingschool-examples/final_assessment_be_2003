class PatientDoctorController < ApplicationController
  def destroy
    patient_doctor = PatientDoctor.find(params[:id])
    PatientDoctor.destroy(patient_doctor.id)
    redirect_to request.referrer
  end
end
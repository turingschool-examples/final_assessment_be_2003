class DoctorPatientsController < ApplicationController

  def destroy
    doctor = Doctor.find(params[:doctor_id])
    doctor_patient = DoctorPatient.find_by(doctor_id: doctor.id, patient_id: params[:id])

    doctor_patient.destroy

    redirect_to doctor_path(doctor)
  end 
end
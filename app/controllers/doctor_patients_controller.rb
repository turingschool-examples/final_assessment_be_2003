class DoctorPatientsController < ApplicationController

    def destroy 
        doctor = Doctor.find(params[:doc_id])
        patient_to_remove = DoctorPatient.where(doctor_id: params[:doc_id]).where(patient_id: params[:id])
        patient_to_remove.first.delete
        redirect_to "/doctors/#{doctor.id}"
    end
end
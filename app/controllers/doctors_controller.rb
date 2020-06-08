class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:doctor_id])
    patients = DoctorPatient.where(doctor_id: @doctor.id)
    @pats = []
    patients.each do |docpat|
      @pats << Patient.where(id: docpat.patient_id)
    end
  end
end

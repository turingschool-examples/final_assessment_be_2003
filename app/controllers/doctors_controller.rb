class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:doctor_id])
    patients = DoctorPatient.where(doctor_id: @doctor.id)
    @pats = []
    patients.each do |docpat|
      @pats << Patient.where(id: docpat.patient_id)
    end
  end

  def new
    @hospital = Hospital.find(params[:hospital_id])
  end

  def create
    hospital = Hospital.find(params[:hospital_id])
    doctor = hospital.doctors.create!(doctor_params)
    if doctor.save
      redirect_to "/hospitals/#{hospital.id}"
  end 

  end

  private

  def doctor_params
    params.permit(:name, :specialty, :education)
  end
end

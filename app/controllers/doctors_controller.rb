class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @hospital = Hospital.find(params[:hospital_id])
  end

  def create
    hospital = Hospital.find(params[:hospital_id])
    new_doctor = hospital.doctors.new(doctor_params)
    if new_doctor.valid?
      new_doctor.save
      redirect_to hospital_path(hospital)
    end
  end

  private
  def doctor_params
    params.permit(:name, :specialty, :education)
  end
end
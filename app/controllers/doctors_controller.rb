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

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    doctor = Doctor.find(params[:id])
    doctor.update(doctor_params)
    if doctor.valid?
      doctor.save
      redirect_to doctor_path(doctor)
    end
  end

  private
  def doctor_params
    params.permit(:name, :specialty, :education, :hospital_id)
  end
end
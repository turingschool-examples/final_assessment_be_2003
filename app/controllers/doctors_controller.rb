class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @hospital = Hospital.find(params[:hospital_id])
    @doctor = Doctor.new
  end

  def create
    hospital = Hospital.find(params[:hospital_id])
    hospital.doctors.create(doc_params)
    redirect_to hospital_path(hospital.id)
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    doctor = Doctor.find(params[:id])
    doctor.update_attribute(:hospital_id, params[:hospital_id])
    redirect_to doctor_path(doctor.id)
  end

  private
  def doc_params
    params.require(:doctor).permit(:name, :specialty, :education)
  end
end

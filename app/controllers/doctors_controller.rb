class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @hospital = Hospital.find(params[:id])
  end

  def create
    hospital = Hospital.find(params[:id])
    hospital.doctors.create!(doctor_params)
    redirect_to "/hospitals/#{hospital.id}"
  end

  def edit
    @doctor = Doctor.find(params[:id])
    @hospitals = Hospital.all
  end

  def update
    hospital = Hospital.find(params[:hospital_id])
    doctor = Doctor.where(hospital_id: params[:hospital_id])
    hospital.doctors << doctor
  end

  private

  def doctor_params
    params.permit(:name, :specialty, :education)
  end
end

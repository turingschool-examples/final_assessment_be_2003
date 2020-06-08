class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @hospital = Hospital.find(params[:hospital_id])
  end

  def create
    hospital = Hospital.find(params[:hospital_id])
    doctor = hospital.doctors.new(doctor_params)

    if doctor.save
      redirect_to "/hospitals/#{hospital.id}"
    else
      redirect_to "/hospitals/#{hospital.id}/doctors/new"
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    doctor = Doctor.find(params[:id])
    doctor.update(doctor_params)
    redirect_to "/doctors/#{doctor.id}"
  end

  private

  def doctor_params
    params.permit(:name, :specialty, :education, :hospital_id)
  end
end
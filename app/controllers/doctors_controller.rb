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

  private

  def doctor_params
    params.permit(:name, :specialty, :education)
  end
end
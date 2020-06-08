class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @hospital = Hospital.find(params[:id])
  end

  def create
    hospital = Hospital.find(params[:hospital_id])
    hospital.doctors.create!(new_doctor_params)
    redirect_to "/hospitals/#{hospital.id}"
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    hospital = Hospital.find(params[:hospital_id])
    doctor = Doctor.find(params[:id])
    doctor.hospital_id = hospital.id
    doctor.save
    redirect_to "/doctors/#{doctor.id}"
  end

  private
    def new_doctor_params
      params.permit(
        :name,
        :specialty,
        :education
      )
    end


end

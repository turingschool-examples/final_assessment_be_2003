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

  private
    def new_doctor_params
      params.permit(
        :name,
        :specialty,
        :education
      )
    end


end

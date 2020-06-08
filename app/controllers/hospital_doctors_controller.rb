class HospitalDoctorsController < ApplicationController

  def new
    @hospital = Hospital.find(params[:hospital_id])
  end 

  def create
    @hospital = Hospital.find(params[:hospital_id])
    doctor = @hospital.doctors.new(doctor_params)

    if doctor.save
      redirect_to hospital_path(@hospital) 
    else
      render :new
    end 
  end 

  private

  def doctor_params
    params.permit(:name, :specialty, :education)
  end
end
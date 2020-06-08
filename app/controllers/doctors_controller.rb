class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @hospital = Hospital.find(params[:id])
  end

  def create
    hospital = Hospital.find(params[:hospital_id])
    hospital.doctors.create!(doctor_params)
    redirect_to "/hospitals/#{hospital.id}"
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    if Hospital.find(params[:hospital_id]) == nil
      flash[:notice]= "Please enter a valid hospital ID"
      rerender edit
    else
      doctor = Doctor.find(params[:id])
      doctor.update(doctor_params)
      redirect_to "/doctors/#{doctor.id}"
    end
  end

  private
  def doctor_params
    params.permit(:name, :specialty, :education, :hospital_id)
  end
end

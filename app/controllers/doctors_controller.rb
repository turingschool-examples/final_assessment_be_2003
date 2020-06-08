class DoctorsController < ApplicationController

  def new
    @hospital = Hospital.find(params[:hospital_id])
    @doctor = @hospital.doctors.new
  end

  def create
    hospital = Hospital.find(params[:hospital_id])
    doctor = hospital.doctors.new(doctor_params)
    if doctor.save
      flash[:success] = "New Doctor Created!"
      redirect_to hospital_path(doctor.hospital.id)
    end
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :specialty, :education)
  end
end

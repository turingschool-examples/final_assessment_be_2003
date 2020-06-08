class DoctorsController < ApplicationController 
  
  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @hospital = Hospital.find(params[:hospital_id])
    @doctor = @hospital.doctors.new
  end

  def create
    hospital = Hospital.find(params[:hospital_id])
    doctor = hospital.doctors.create(doctor_params)
    if doctor.save 
      redirect_to hospital_path(hospital)
    else 
      redirect_to new_hospital_doctor_path(hospital)
    end
  end
  
  private

  def doctor_params
    params.require(:doctor).permit(:name, :specialty, :education)
  end



end
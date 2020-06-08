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

  def edit 
    @doctor = Doctor.find(params[:id])
  end

  def update 
    doctor = Doctor.find(params[:id])
    doctor.update(hospital_id: params[:doctor][:hospital_id])
    redirect_to doctor_path(doctor)
  end
  
  private

  def doctor_params
    params.require(:doctor).permit(:name, :specialty, :education)
  end



end
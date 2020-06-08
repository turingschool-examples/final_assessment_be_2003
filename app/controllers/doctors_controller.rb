class DoctorsController < ApplicationController

  def index
    @hospital = Hospital.find(params[:hospital_id])
  end

  def new
    @hospital = Hospital.find(params[:hospital_id])
    @doctor = @hospital.doctors.new
  end

  def create
    @hospital = Hospital.find(params[:hospital_id])
    @doctor = @hospital.doctors.new(doctor_params)
    if @doctor.save
      flash[:success] = "New Doctor Created!"
      redirect_to hospital_path(@doctor.hospital.id)
    else
      flash[:error] = @doctor.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    @doctor.update(doctor_params)
    if @doctor.save
      flash[:success] = "Doctor Updated"
      redirect_to doctor_path(@doctor.id)
    else
      flash[:error] = "#{doctor_params[:hospital_id]} is not a valid hospital id"
      render :edit
    end
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :specialty, :education, :hospital_id)
  end
end

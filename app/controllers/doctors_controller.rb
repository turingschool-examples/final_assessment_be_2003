class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @hospital = Hospital.find(params[:hospital_id])
    @doctor = Doctor.new
  end

  def create
    hospital = Hospital.find(params[:hospital_id])
    hospital.doctors.create(doc_params)
    redirect_to hospital_path(hospital.id)
  end

  private
  def doc_params
    params.require(:doctor).permit(:name, :specialty, :education)
  end
end

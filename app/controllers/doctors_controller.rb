class DoctorsController < ApplicationController
  def show
    @doc = Doctor.find(params[:id])
  end

  def new
  end

  def create
    hospital = Hospital.find(params[:id])
    hospital.doctors.create(doctor_params)
    redirect_to "/hospitals/#{params[:id]}"
  end

  def edit
  end

  private

  def doctor_params
    params.permit(:name,:specialty,:school)
  end
end

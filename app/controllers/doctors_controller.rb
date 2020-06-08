class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @hospital = Hospital.find(params[:id])
  end

  def create
    @hospital = Hospital.find(params[:id])
    @doctor = @hospital.doctors.new(doctor_params)
    if @doctor.save
      redirect_to "/hospitals/#{@hospital.id}"
    else
      flash[:error] = "#{@doctor.errors.full_messages.to_sentence}"
      render :new
    end
  end

  def update
    binding.pry
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :specialty, :education)
  end
end

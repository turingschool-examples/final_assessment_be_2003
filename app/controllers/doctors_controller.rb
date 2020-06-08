class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
   @hospital = Hospital.find(params[:id])
   return @doctor if params[:doctor]
   @doctor = Hash.new("")
  end

  def create
    @hospital = Hospital.find(params[:hospital_id])
    doctor = @hospital.doctors.create(doctor_params)
    redirect_to "/hospitals/#{@hospital.id}"
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    @doctor.update(doctor_params)
    if @doctor.save
      redirect_to "/doctors/#{@doctor.id}"
    else
      flash[:error] = @doctor.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

 def doctor_params
   params.permit(:name,:specialty,:education, :hospital_id)
 end
end

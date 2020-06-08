class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    # require "pry"; binding.pry
   # @hospital_doctor = Hospital.find(params[:id])
   @hospital = Hospital.find(params[:id])
   return @doctor if params[:doctor]
   @doctor = Hash.new("")
  end

  def create
    @hospital = Hospital.find(params[:hospital_id])
    doctor = @hospital.doctors.create(doctor_params)
    redirect_to "/hospitals/#{@hospital.id}"
  end
  
  private

 def doctor_params
   params.permit(:name,:specialty,:education)
 end
end

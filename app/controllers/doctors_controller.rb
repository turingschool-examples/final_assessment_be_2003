class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def edit
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
    @doctor = Doctor.find(params[:id])
    if params[:patient]
      @patient = Patient.find(params[:patient])
      @doctor.patients.delete(@patient)
      redirect_to "/doctors/#{@doctor.id}"
    else
      @doctor.update(hospital_id:params[:hospital])
      redirect_to "/doctors/#{@doctor.id}"
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :specialty, :education)
  end
end

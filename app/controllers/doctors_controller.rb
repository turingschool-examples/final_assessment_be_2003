class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @hospital = Hospital.find_by(id: params[:hospital_id])
  end

  def create
    hospital_id = params[:hospital_id]
    doctor = Doctor.create(doctor_params)
    if doctor.save
      redirect_to "/hospitals/#{hospital_id}"
    else
      flash[:error] = "Fill in all the blanks and try submitting again."
      redirect_to "/hospitals/#{hospital_id}/doctors/new"
    end
  end

  private

  def doctor_params
    params.permit(:name, :speciality, :education, :hospital_id)
  end
end

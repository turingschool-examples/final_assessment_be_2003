class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @hospital = Hospital.find(params[:id])
  end

  def create
    hospital = Hospital.find(params[:id])
    hospital.doctors.create(doctor_params)
    redirect_to "/hospitals/#{hospital.id}"
  end

  def destory

    relation = DoctorPatient.where(doctor_id: params[:doctor_id], patient_id: params[:patient_id])
    DoctorPatient.delete(relation)
    redirect_to "/doctors/#{params[:doctor_id]}"
  end

  private

  def doctor_params
    params.permit(:name, :specialty, :education)

  end

end

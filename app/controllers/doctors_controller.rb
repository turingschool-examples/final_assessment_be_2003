class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @hospital = Hospital.find(params[:id])
  end

  def create
    hospital = Hospital.find(params[:id])
     doctor = hospital.doctors.create(doctor_params)
     if doctor.save
    redirect_to "/hospitals/#{hospital.id}"
    else
      redirect_to "/hospitals/#{hospital.id}/doctors/new"
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def destory

    relation = DoctorPatient.where(doctor_id: params[:doctor_id], patient_id: params[:patient_id])
    DoctorPatient.delete(relation)
    redirect_to "/doctors/#{params[:doctor_id]}"
  end

  def update
    hospital = Hospital.find(params[:id])
    doctor = Doctor.find(params[:doctor_id])
    doctor.update(hospital_id: hospital.id)
    doctor.save
    redirect_to "/doctors/#{doctor.id}"
  end

  private

  def doctor_params
    params.permit(:name, :specialty, :education)

  end

end

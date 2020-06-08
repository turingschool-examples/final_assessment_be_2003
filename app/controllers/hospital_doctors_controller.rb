class HospitalDoctorsController < ApplicationController 

    def new 
        @hospital = Hospital.find(params[:id])
    end

    def create
        hospital = Hospital.find(params[:id])
        doctor = Doctor.new(hospital_doctor_params)
        doctor.hospital_id = hospital.id
        doctor.save
        redirect_to "/hospitals/#{hospital.id}"
    end 

    private

    def hospital_doctor_params
        params.permit(:name, :specialty, :education)
    end 
end 
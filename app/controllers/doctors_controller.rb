class DoctorsController < ApplicationController

    def show
        @doctor = Doctor.find(params[:id])       
    end

    def edit
        @doctor = Doctor.find(params[:id]) 
    end

    def update
        doctor = Doctor.find(params[:id])
        doctor.update(hospital_id: params[:hosp_id])
        redirect_to "/doctors/#{doctor.id}"
    end 

    private
    def new_hospital_params
        params.permit(:id)
    end 
end 
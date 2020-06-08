class PatientsController < ApplicationController

  def destroy 
    patient = Doctor.patients.find(params[:id])

    patient.destroy
    redriect 
  end
end

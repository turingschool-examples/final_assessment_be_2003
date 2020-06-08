class PatientsController < ApplicationController
  def index
    @hospital = Hospital.find(params[:hospital_id])
    @patients = Patient.all
  end
end

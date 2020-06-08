class HospitalPatientsController < ApplicationController

  def index
    @hospital = Hospital.find(params[:hospital_id])
    @hospital_patients = Patient.sort_by_age(@hospital.id, 'desc')
  end 
end
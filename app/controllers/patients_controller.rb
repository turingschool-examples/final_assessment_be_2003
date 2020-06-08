class PatientsController < ApplicationController
  def index
    if params[:hospital_id]
      hospital = Hospital.find(params[:hospital_id])
      @patient_names = hospital.age_sorted_patient_names
    else
      @patients = Patient.all
    end
  end
end

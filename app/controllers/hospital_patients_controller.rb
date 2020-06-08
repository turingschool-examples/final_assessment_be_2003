class HospitalPatientsController < ApplicationController
  def index
    @hospital = Hospital.find(params[:hospital_id])
    @pats = []
    @hospital.doctors.each do |doctor|
      @pats << doctor.patients
    end
  end
end

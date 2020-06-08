class HospitalPatientsController < ApplicationController

  def index
    @hospital = Hospital.find(params[:id])
    @hospital.doctors.each do |doctor|
      doctor.patients.order(:age)
    end
  end
end
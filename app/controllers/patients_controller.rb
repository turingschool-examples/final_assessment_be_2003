class PatientsController < ApplicationController
  def index
    @patients = []
    hospital = Hospital.find(params[:id])
    hospital.doctors.each do |doc|
      doc.patients.each do |patient|
        @patients << patient
      end
    end
  end
end

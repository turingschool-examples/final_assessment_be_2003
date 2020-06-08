class PatientsController < ApplicationController
  def index
    # require "pry";binding.pry
    @patients = []
    hospital = Hospital.find(params[:id])
    hospital.doctors.each do |doc|
      doc.patients.each do |patient|
        @patients << patient
      end
    end
    @patients = @patients.sort_by {|patient| patient.age}.reverse
  end

  def edit
    patient = Patient.find(params[:id])
    patient.update(waiting?: true)
    redirect_to(request.env['HTTP_REFERER'])
  end
end


# id = params[:id].to_i
# docs = Doctor.where(hospital_id: id)
# docs.patients.

require 'rails_helper'

RSpec.describe "hospital patient index page", type: :feature do
  before(:each) do
    @grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city:"Seatle", state: "WA", zip: "98101")
    @seaside = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city:"Los Angeles", state: "CA", zip: "90001")

    @grey = @grey_sloan.doctors.create(name:  "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    @karev = @grey_sloan.doctors.create(name:  "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")

    @jen = Patient.create(name: "Jen Ducket", age: 19)
    @erik = Patient.create(name: "Erik Palladino", age: 22)
    @ethan = Patient.create(name: "Ethan Embry", age: 21)
    @lauren = Patient.create(name: "Lauren Ambrose", age: 18)

    DoctorPatient.create(doctor_id: @grey.id, patient_id: @jen.id)
    DoctorPatient.create(doctor_id: @grey.id, patient_id: @erik.id)
    DoctorPatient.create(doctor_id: @karev.id, patient_id: @jen.id)
    DoctorPatient.create(doctor_id: @karev.id, patient_id: @ethan.id)
    DoctorPatient.create(doctor_id: @karev.id, patient_id: @lauren.id)
  end

end
# User Story 3, Hospital Patient Index Page
# As a visitor
# When I visit the hospitals show page
# I see a link to view all of that hospitals patients
# When I click that link
# I'm taken to a patients index page for that hospital
# I see the names of all that hospital's patients listed from oldest to youngest

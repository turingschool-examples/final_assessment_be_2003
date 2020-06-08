require 'rails_helper'

RSpec.describe "doctors show page", type: :feature do
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
    visit "/doctors/#{@grey.id}"
  end

  it "can see doctor's info" do
      expect(page).to have_content(@grey.name)
      expect(page).to have_content(@grey.specialty)
      expect(page).to have_content(@grey.education)
      expect(page).to have_content("Grey Sloan Memorial Hospital")
  end

  it "list of all its patients" do
    expect(page).to have_content(@jen.name)
    expect(page).to have_content(@erik.name)
  end
end

# User Story 1, Doctors Show Page
# 'As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
#  - name
#  - specialty
#  - university where they got their doctorate
# And I see the name of the hospital where this doctor works
# And I see the names of all of the patients this doctor has

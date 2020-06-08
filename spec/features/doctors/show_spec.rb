require 'rails_helper'

RSpec.describe "Doctor Show Page" do
  before(:each) do
    @sloan = Hospital.create(name: "Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city: "Seattle", state: "WA", zipcode: "98101")
    @meredith = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: @sloan.id)
    @katie = Patient.create(name: "Katie Bryce", age: 24)
    @rebecca = Patient.create(name: "Rebecca Pope", age: 32)
    @denny = Patient.create(name: "Denny Duquette", age: 39)

    DoctorPatient.create(doctor_id: @meredith.id, patient_id: @katie.id)
    DoctorPatient.create(doctor_id: @meredith.id, patient_id: @rebecca.id)
  end

  it "displays doctor's name, specialty, university, hosiptal, and a list of their patients" do
    visit "/doctors/#{@meredith.id}"
    expect(page).to have_content(@meredith.name)
    expect(page).to have_content(@meredith.specialty)
    expect(page).to have_content(@meredith.hospital.name)

    within "#doctors_patients" do
      expect(page).to have_content(@katie.name)
      expect(page).to have_content(@rebecca.name)
      expect(page).to_not have_content(@denny.name)
    end
  end
end

require "rails_helper"

RSpec.describe "From the doctor show" do
  it "I can remove a patient from that doctor" do
    grey = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    meridith  = grey.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    katie = Patient.create(name: "Katie Bryce", age: 24)
    denny = Patient.create(name: "Denny Duquette", age: 39)
    DoctorPatient.create(doctor_id: meridith.id, patient_id: katie.id)
    DoctorPatient.create(doctor_id: meridith.id, patient_id: denny.id)
    visit doctor_path(meridith.id)
    within "#patient-#{katie.id}" do
      click_on "Remove Patient"
    end
    expect(current_path).to eq(doctor_path(meridith.id))
    expect(page).to_not have_content(katie.name)
    expect(page).to have_content(denny.name)
  end

end

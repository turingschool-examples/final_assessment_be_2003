require "rails_helper"

RSpec.describe "Doctor show page" do
  it "has all of the doctors info" do
    grey = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    meridith  = grey.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    katie = Patient.create(name: "Katie Bryce", age: 24)
    denny = Patient.create(name: "Denny Duquette", age: 39)
    DoctorPatient.create(doctor_id: meridith.id, patient_id: katie.id)
    DoctorPatient.create(doctor_id: meridith.id, patient_id: denny.id)
    visit "/doctors/#{meridith.id}"
    expect(page).to have_content(meridith.name)
    expect(page).to have_content(meridith.specialty)
    expect(page).to have_content(meridith.education)
    expect(page).to have_content(grey.name)
    within ".patients" do
      expect(page).to have_content(katie.name)
      expect(page).to have_content(denny.name)
    end
  end

end

require "rails_helper"

RSpec.describe "Hospital show page" do
  it "has all of the hospitals info" do
    grey = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    meridith  = grey.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    grey.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
    grey.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Harvard University")
    katie = Patient.create(name: "Katie Bryce", age: 24)
    denny = Patient.create(name: "Denny Duquette", age: 39)
    DoctorPatient.create(doctor_id: meridith.id, patient_id: katie.id)
    DoctorPatient.create(doctor_id: meridith.id, patient_id: denny.id)
    visit hospital_path(grey.id)

    expect(page).to have_content(grey.name)
    expect(page).to have_content(grey.address)
    expect(page).to have_content(grey.city)
    expect(page).to have_content(grey.street)
    expect(page).to have_content(grey.zip)
    expect(page).to have_content("Number of Doctors 3")
    within ".universities" do
      expect(page).to have_content("Harvard University", count: 1)
      expect(page).to have_content("Johns Hopkins University")
    end
  end

end

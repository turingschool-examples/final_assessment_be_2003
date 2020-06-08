require "rails_helper"

RSpec.describe "Hospital patients index page" do
  it "can be accessed from the hospital show page" do
    grey = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    meridith  = grey.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    grey.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
    grey.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Harvard University")
    katie = Patient.create(name: "Katie Bryce", age: 24)
    denny = Patient.create(name: "Denny Duquette", age: 39)
    DoctorPatient.create(doctor_id: meridith.id, patient_id: katie.id)
    DoctorPatient.create(doctor_id: meridith.id, patient_id: denny.id)
    visit hospital_path(grey.id)
    click_link "View All Patients"
    expect(current_path).to eq("/hospitals/#{grey.id}/patients")
  end

  it "shows the names of all that hospitals patients ordered from oldest to youngest" do
    grey = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    meridith  = grey.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    grey.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
    grey.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Harvard University")
    katie = Patient.create(name: "Katie Bryce", age: 24)
    denny = Patient.create(name: "Denny Duquette", age: 39)
    zola = Patient.create(name: "Zola  Shepherd", age: 2)
    DoctorPatient.create(doctor_id: meridith.id, patient_id: katie.id)
    DoctorPatient.create(doctor_id: meridith.id, patient_id: denny.id)
    visit hospital_patients_path(grey.id)
    expect(denny.name).to appear_before(katie.name)
    expect(page).to_not have_content(zola.name)
  end

end

require "rails_helper"

RSpec.describe "Doctor creation" do
  it "I can access the doctor creation form from the hospital show page" do
    grey = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    meridith  = grey.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    grey.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
    grey.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Harvard University")
    katie = Patient.create(name: "Katie Bryce", age: 24)
    denny = Patient.create(name: "Denny Duquette", age: 39)
    DoctorPatient.create(doctor_id: meridith.id, patient_id: katie.id)
    DoctorPatient.create(doctor_id: meridith.id, patient_id: denny.id)
    visit hospital_path(grey.id)
    click_link "Create New Doctor"
    expect(current_path).to eq("/hospitals/#{grey.id}/doctors/new")
  end
  it "I can create a new doctor" do
    grey = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    meridith  = grey.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    grey.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
    grey.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Harvard University")
    katie = Patient.create(name: "Katie Bryce", age: 24)
    denny = Patient.create(name: "Denny Duquette", age: 39)
    DoctorPatient.create(doctor_id: meridith.id, patient_id: katie.id)
    DoctorPatient.create(doctor_id: meridith.id, patient_id: denny.id)
    visit hospital_path(grey.id)
    click_link "Create New Doctor"
    expect(page).to have_content("New Doctor Hire for #{grey.name}")
    fill_in "Name", with: "new doc"
    fill_in "Specialty", with: "general"
    fill_in "Education", with: "Turing"
    click_on "Create Doctor"

    expect(current_path).to eq(hospital_path(grey.id))
    expect(page).to have_content("New Doctor Created!")
    expect(page).to have_content("Number of Doctors: 4")
  end

  it "Must fill in all fields" do
    grey = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    visit hospital_path(grey.id)
    click_link "Create New Doctor"
    fill_in "Name", with: ""
    fill_in "Specialty", with: "general"
    fill_in "Education", with: "Turing"
    click_on "Create Doctor"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_button("Create Doctor")
  end

end

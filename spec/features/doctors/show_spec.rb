require 'rails_helper'

RSpec.describe "Doctor Show Page" do
  before(:each) do
    @sloan = Hospital.create(name: "Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city: "Seattle", state: "WA", zipcode: "98101")
    @seaside = Hospital.create(name:"Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zipcode: "90001")

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

  it "displays button to remove patient from caseload" do
    visit "/doctors/#{@meredith.id}"
    within "#patient-#{@katie.id}" do
      click_link "remove patient"
    end
    expect(current_path).to eq("/doctors/#{@meredith.id}")
    expect(page).to_not have_content(@katie.name)
  end

  it "allows user to assign doctor to different hospital" do
    visit "/doctors/#{@meredith.id}"
    click_link "Assign #{@meredith.name} to a Different Hospital"
    expect(current_path).to eq("/doctors/#{@meredith.id}/edit")

    fill_in :hospital_id, with: @seaside.id
    click_button "Add #{@meredith.name} to this hospital"

    expect(current_path).to eq("/doctors/#{@meredith.id}")
    expect(page).to have_content(@seaside.name)
    expect(page).to_not have_content(@sloan.name)

  end
end

require 'rails_helper'

RSpec.describe "Doctor Show Page" do
  it "can see doctor information including hospital name" do
    grey = Hospital.create(name:"Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
   
    meredith = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: grey.id)
    alex = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Stanford University", hospital_id: grey.id)

    visit "/doctors/#{meredith.id}"

    expect(page).to have_content(meredith.name)
    expect(page).to have_content(meredith.specialty)
    expect(page).to have_content(meredith.education)
    expect(page).to have_content(grey.name)
  end

  it "can see the names of all of the patients this doctor has" do
    grey = Hospital.create(name:"Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
   
    meredith = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: grey.id)
    alex = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Stanford University", hospital_id: grey.id)
    
    katie = meredith.patients.create(name: "Katie Bryce", age: 24)
    denny = meredith.patients.create(name: "Denny Duquette", age: 39)

    visit "/doctors/#{meredith.id}"

    expect(page).to have_content(katie.name)
    expect(page).to have_content(denny.name)
  end

  it "can remove a patient from a doctor" do
    grey = Hospital.create(name:"Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    meredith = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: grey.id)
    
    katie = meredith.patients.create(name: "Katie Bryce", age: 24)
    denny = meredith.patients.create(name: "Denny Duquette", age: 39)

    visit "/doctors/#{meredith.id}"

    within ".patients-#{katie.id}" do
      click_link "Remove Patient"
    end

    expect(current_path).to eq("/doctors/#{meredith.id}")
    expect(page).to have_no_content(katie.name)
  end
end

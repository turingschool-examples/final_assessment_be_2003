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

  it "can reassign a doctor to an existing hospital" do
    grey = Hospital.create(name:"Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    seaside = Hospital.create(name:"Seaside Health & Wellness Center", address: "123 Private Practice Rd", city: "Los Angeles", state: "CA", zip: "90001")
    meredith = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: grey.id)
 
    visit "/doctors/#{meredith.id}"

    click_link "Assign #{meredith.name} to a Different Hospital"
    expect(current_path).to eq("/doctors/#{meredith.id}/edit")

    fill_in "Hospital ID", with: seaside.id
    click_button "Submit"

    expect(current_path).to eq("/doctors/#{meredith.id}")
    expect(page).to have_content("Current Hospital: #{seaside.name}")
    expect(page).to have_no_content(grey.name)
  end
end


# User Story 6, Reassign Doctor to Different Hospital
# As a visitor
# When I visit a doctor's show page
# Next to the name of the hospital where this doctor works
# I see a link that says "Assign <insert name of doctor> to a Different Hospital"
# When I click on that link
# I'm taken to a form where I can input an id of an existing hospital
# When I click "Add <insert name of doctor> to this hospital"
# I'm taken back to that doctor's show page
# And I can see the name of the new hospital that they were assigned to
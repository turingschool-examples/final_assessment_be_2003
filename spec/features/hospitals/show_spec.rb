require 'rails_helper'

RSpec.describe "Hospital Show Page" do
  it "can see hospital information" do
    grey = Hospital.create(name:"Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
   
    visit "/hospitals/#{grey.id}"
    
    expect(page).to have_content(grey.name)
    expect(page).to have_content(grey.address)
    expect(page).to have_content(grey.city)
    expect(page).to have_content(grey.state)
    expect(page).to have_content(grey.zip)
  end

  it "can see count of doctors attending and unique univerities they attended" do 
    grey = Hospital.create(name:"Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")

    meredith = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: grey.id)
    alex = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Stanford University", hospital_id: grey.id)
    mirando = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: grey.id)
    mcdreamy = Doctor.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: grey.id)
    
    visit "/hospitals/#{grey.id}"

    expect(page).to have_content("Number of Doctors: 4")
    expect(page).to have_content("Stanford University", count: 1)
    expect(page).to have_content("Harvard University")
    expect(page).to have_content("University of Pennsylvania")

  end
end





# User Story 2, Hospital S'ow Page
# "As a visitor
# When I visit a hospital's show "ag'
# I see the hospital's name,'street address, city, state, and zip
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended
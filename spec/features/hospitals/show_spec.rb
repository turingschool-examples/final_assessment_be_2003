require 'rails_helper'

RSpec.describe "Hospital's Show Page" do

  it "displays the hospital's name,street address, city, state, and zip, number of doctors, and unique list of universities" do
    memorial = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")

    grey = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: memorial.id)
    bailey = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: memorial.id)
    karev = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: memorial.id)
    yang = Doctor.create(name: "Cristina Yang", specialty: "Cardiothoracic Surgery", education: "Stanford University", hospital_id: memorial.id)
    shepherd = Doctor.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: memorial.id)
    sloan = Doctor.create(name: "Mark McSteamy Sloan", specialty: "Plastic Surgeron", education: "University of Pennsylvania", hospital_id: memorial.id)

    visit "/hospitals/#{memorial.id}"

    expect(page).to have_content("Grey Sloan Memorial Hospital")
    expect(page).to have_content("123 Save Lives Rd")
    expect(page).to have_content("Seattle")
    expect(page).to have_content("WA")
    expect(page).to have_content("98101")
    expect(page).to have_content("Number of Doctors: 6")
    expect(page).to have_content(["Harvard University", "Johns Hopkins University", "Stanford University", "University of Pennsylvania"])
  end

  it "I can click link to that hospital's patients index page" do
    memorial = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")

    grey = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: memorial.id)
    bailey = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: memorial.id)
    karev = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: memorial.id)
    yang = Doctor.create(name: "Cristina Yang", specialty: "Cardiothoracic Surgery", education: "Stanford University", hospital_id: memorial.id)
    shepherd = Doctor.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: memorial.id)
    sloan = Doctor.create(name: "Mark McSteamy Sloan", specialty: "Plastic Surgeron", education: "University of Pennsylvania", hospital_id: memorial.id)

    visit "/hospitals/#{memorial.id}"

    click_link "See All Patients"
    expect(current_path).to eq("/hospitals/#{memorial.id}/patients")
  end
end

# User Story 3, Hospital Patient Index Page
# As a visitor
# When I visit the hospitals show page
# I see a link to view all of that hospitals patients
# When I click that link
# I'm taken to a patients index page for that hospital
# I see the names of all that hospital's patients listed from oldest to youngest



# User Story 2, Hospital Show Page
# "As a visitor
# When I visit a hospital's show page
# I see the hospital's name,street address, city, state, and zip
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended

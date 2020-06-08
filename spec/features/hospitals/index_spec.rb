require "rails_helper"

RSpec.describe "Hospital Patients Index Page" do
  it "Displays patients names from youngest to oldest" do
    hospital = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: 98101})
    meredith = Doctor.create({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: "#{hospital.id}"})
    alex = Doctor.create({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: "#{hospital.id}"})
    katie = Patient.create({name: "Katie Bryce", age: 24})
    denny = Patient.create({name: "Denny Duquette", age: 39})
    rebecca = Patient.create({name: "Rebecca Pope", age: 32})
    zola = Patient.create({name: "Zola  Shepherd", age: 2})
    meredith.patients << rebecca
    meredith.patients << katie
    meredith.patients << denny
    visit "/hospitals/#{hospital.id}"
    click_link ("View all Patients")
    expect(current_path).to eql("/hospitals/#{hospital.id}/patients")
    expect("#{denny.name}").to appear_before("#{rebecca.name}")
    expect("#{rebecca.name}").to appear_before("#{katie.name}")
    expect(page).not_to have_content("#{zola.name}")
    expect(page).to have_content("#{rebecca.name}")
    expect(page).to have_content("#{denny.name}")
    expect(page).to have_content("#{katie.name}")
  end
end


# User Story 3, Hospital Patient Index Page
# As a visitor
# When I visit the hospitals show page
# I see a link to view all of that hospitals patients
# When I click that link
# I'm taken to a patients index page for that hospital
# I see the names of all that hospital's patients listed from oldest to youngest

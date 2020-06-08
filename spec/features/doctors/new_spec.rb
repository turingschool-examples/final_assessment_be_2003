require 'rails_helper'

RSpec.describe "Creating a Doctor" do
  it "can create a new doctor" do
    memorial = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")

    grey = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: memorial.id)
    bailey = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: memorial.id)
    karev = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: memorial.id)
    yang = Doctor.create(name: "Cristina Yang", specialty: "Cardiothoracic Surgery", education: "Stanford University", hospital_id: memorial.id)
    shepherd = Doctor.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: memorial.id)
    sloan = Doctor.create(name: "Mark McSteamy Sloan", specialty: "Plastic Surgeron", education: "University of Pennsylvania", hospital_id: memorial.id)

    visit "/hospitals/#{memorial.id}"

    click_link "New Doctor For Hire"
    expect(current_path).to eq("/hospitals/#{memorial.id}/doctors/new")

    fill_in :name, with: "Jackson Avery"
    fill_in :specialty, with: "Plastic Surgery"
    fill_in :education, with: "Boston University"

    click_on "Submit"
    save_and_open_page
    expect(current_path).to eq("/hospitals/#{memorial.id}")
    expect(page).to have_content("Number of Doctors: 7")
  end
end








# User Story 4, Creating a Doctor
# As a visitor
# When I visit a hospital's show page
# I see a link to add a doctor for this hospital
# When I click that link
# I'm taken to a page that has a title of "New Doctor Hire for <insert hospital name here>"
# And on that page there's a form for me to enter a new doctor's name, specialty, and university where they got their doctorate.
# When I fill out all three fields and click submit
# I am taken back to the hospital show page
# And I can see that the number of doctors has increased by one

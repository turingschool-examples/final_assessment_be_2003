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
    expect(page).to have_content("Number of Doctors: 6")

    click_link "New Doctor For Hire"
    expect(current_path).to eq("/hospitals/#{memorial.id}/doctors/new")

    fill_in :name, with: "Jackson Avery"
    fill_in :specialty, with: "Plastic Surgery"
    fill_in :education, with: "Boston University"

    click_on "Submit"
    expect(current_path).to eq("/hospitals/#{memorial.id}")
    expect(page).to have_content("Number of Doctors: 7")
  end
end

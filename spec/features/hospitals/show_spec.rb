require "rails_helper"

RSpec.describe "Hospital Show Page", type: :feature do
  it "displays hospital information, the doctors working their, and the doctors education" do
    hospital_1 = Hospital.create({name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: 90001})
    hospital_2 = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: 98101})
    meredith = Doctor.create({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: "#{hospital_2.id}"})
    alex = Doctor.create({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: "#{hospital_2.id}"})
    visit "/hospitals/#{hospital_2.id}"
    expect(page).not_to have_content(hospital_1.name)
    expect(page).to have_content(hotpital_2.name)
    expect(page).to have_content(hotpital_2.address)
    expect(page).to have_content(hotpital_2.city)
    expect(page).to have_content(hotpital_2.state)
    expect(page).to have_content(hotpital_2.zip)
    expect(page).to have_content("Number of Doctors: 2")
  end
end



# User Story 2, Hospital Show Page
# "As a visitor
# When I visit a hospital's show page
# I see the hospital's name,street address, city, state, and zip
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended

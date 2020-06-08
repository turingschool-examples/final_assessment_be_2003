require 'rails_helper'

describe 'Hospital show page' do
  it "shows all of a hospital's information" do
    grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital",
                                 address: "123 Save Lives Rd",
                                 city: "Seattle",
                                 state: "WA",
                                 zip: "98101")

    seaside = Hospital.create(name: "Seaside Health & Wellness Center",
                              address: "123 Private Practice Rd",
                              city: "Los Angeles",
                              state: "CA",
                              zip: "90001")

    meredith = Doctor.create(name: "Meredith Grey",
                             specialty: "General Surgery",
                             education: "Harvard University",
                             hospital_id: grey_sloan.id)

    alex = Doctor.create(name: "Alex Karev",
                         specialty: "Pediatric Surgery",
                         education: "Johns Hopkins University",
                         hospital_id: grey_sloan.id)

    mcdreamy = Doctor.create(name: "Derek Shepherd",
                         specialty: "Attending Surgeon",
                         education: "University of Pennsylvania",
                         hospital_id: seaside.id)

    visit hospital_path(grey_sloan.id)

    expect(page).to have_content(grey_sloan.name)
    expect(page).to have_content(grey_sloan.address)
    expect(page).to have_content(grey_sloan.city)
    expect(page).to have_content(grey_sloan.state)
    expect(page).to have_content(grey_sloan.zip)
    expect(page).to have_content("Number of doctors on staff: 2")

    expect(page).to have_content(meredith.education)
    expect(page).to have_content(alex.education)
    expect(page).to_not have_content(mcdreamy.education)
  end
end


# User Story 2, Hospital Show Page
# "As a visitor
# When I visit a hospital's show page
# I see the hospital's name,street address, city, state, and zip
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended

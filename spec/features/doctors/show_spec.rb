require "rails_helper"

RSpec.describe "Doctor show page" do
    it "as a visitor I see doctors info" do
  general = Hospital.create!(name: "Grey Sloan Memorial Hospital",
                             address: "123 Save Lives Rd",
                             city: "Seattle",
                             state: "WA",
                             zip: "98101")

  meredith = general.doctors.create!(name: "Meredith Grey",
                            specialty: "General Surgery",
                            education: "Harvard University")

  mcdreamy = general.doctors.create!(name: "Derek McDreamy Shepherd",
                            specialty: "Attending Surgeon",
                            education: "University of Pennsylvania")

  visit "/doctors/#{meredith.id}"

  expect(page).to have_content(meredith.name)
  expect(page).to have_content("Meredith Grey")
  expect(page).to have_content(meredith.specialty)
  expect(page).to have_content(meredith.education)

  expect(page).to_not have_content(mcdreamy.name)
  expect(page).to_not have_content(mcdreamy.specialty)
  end

  it "I can also see the name of the hospital where the doctor works" do

    general = Hospital.create!(name: "Grey Sloan Memorial Hospital",
                               address: "123 Save Lives Rd",
                               city: "Seattle",
                               state: "WA",
                               zip: "98101")
    seaside = Hospital.create!(name: "Seaside Health & Wellness Center",
                               address: "123 Private Practice Road",
                               city: "Los Angeles",
                               state: "CA",
                               zip: "90001")

    meredith = general.doctors.create!(name: "Meredith Grey",
                              specialty: "General Surgery",
                              education: "Harvard University")

    karev = seaside.doctors.create!(name: "Alex Karev",
                              specialty: "Pediatric Surgery",
                              education: "Johns Hopkins University")

    visit "/doctors/#{meredith.id}"

    expect(page).to have_content("Currently works at: #{general.name}")
    expect(page).to_not have_content("Currently works at: #{seaside.name}")


  end

  it "I see the names of all of the patients this doctor has" do
    general = Hospital.create!(name: "Grey Sloan Memorial Hospital",
                               address: "123 Save Lives Rd",
                               city: "Seattle",
                               state: "WA",
                               zip: "98101")
    seaside = Hospital.create!(name: "Seaside Health & Wellness Center",
                               address: "123 Private Practice Road",
                               city: "Los Angeles",
                               state: "CA",
                               zip: "90001")

    meredith = general.doctors.create!(name: "Meredith Grey",
                              specialty: "General Surgery",
                              education: "Harvard University")

    karev = seaside.doctors.create!(name: "Alex Karev",
                              specialty: "Pediatric Surgery",
                              education: "Johns Hopkins University")

    katie = meredith.patients.create!(name: "Katie Bryce",
                            age: "24")

    denny = meredith.patients.create!(name: "Denny Duquette",
                            age: "39")

    rebecca = karev.patients.create!(name: "Rebecca Pope",
                            age: "32")

    visit "/doctors/#{meredith.id}"

    expect(page).to have_content(katie.name)
    expect(page).to have_content(denny.name)
    expect(page).to_not have_content(rebecca.name)
  end
end

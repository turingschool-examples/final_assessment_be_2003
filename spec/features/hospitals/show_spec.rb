require "rails_helper"

RSpec.describe "Hospital Show Page" do
  it "I see hospitals info, number of doctors, unique list of universities that this hospital's doctors attended" do

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
    mcdreamy = general.doctors.create!(name: "Derek McDreamy Shepherd",
                                       specialty: "Attending Surgeon",
                                       education: "University of Pennsylvania")

    karev = seaside.doctors.create!(name: "Alex Karev",
                                    specialty: "Pediatric Surgery",
                                    education: "Johns Hopkins University")

    katie = meredith.patients.create!(name: "Katie Bryce",
                            age: "24")

    denny = meredith.patients.create!(name: "Denny Duquette",
                            age: "39")

    rebecca = karev.patients.create!(name: "Rebecca Pope",
                            age: "32")

    visit "/hospitals/#{general.id}"

    expect(page).to have_content(general.name)
    expect(page).to have_content(general.address)
    expect(page).to have_content(general.city)
    expect(page).to have_content(general.state)
    expect(page).to have_content(general.zip)
    expect(page).to_not have_content(seaside.name)

    expect(page).to have_content("Current number of doctors: 2")

    expect(page).to have_content(meredith.education)
    expect(page).to have_content(mcdreamy.education)
    expect(page).to_not have_content(karev.education)

  end

  it "link to view all hospitals patients, click link, taken to a patients index page for that hospital " do

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
    mcdreamy = general.doctors.create!(name: "Derek McDreamy Shepherd",
                                       specialty: "Attending Surgeon",
                                       education: "University of Pennsylvania")

    karev = seaside.doctors.create!(name: "Alex Karev",
                                    specialty: "Pediatric Surgery",
                                    education: "Johns Hopkins University")

    katie = meredith.patients.create!(name: "Katie Bryce",
                            age: "24")

    denny = meredith.patients.create!(name: "Denny Duquette",
                            age: "39")

    rebecca = karev.patients.create!(name: "Rebecca Pope",
                            age: "32")

    visit "/hospitals/#{general.id}"

    expect(page).to have_link("Hospital Patients")

    click_link "Hospital Patients"
    expect(current_path).to eq("/patients")


    # I see the names of all that hospital's patients listed from oldest to youngest
  end
  # describe "link to add a doctor for this hospital" do
  #   xit "fill out new doctor form" do
  #
  #     general = Hospital.create!(name: "Grey Sloan Memorial Hospital",
  #                                address: "123 Save Lives Rd",
  #                                city: "Seattle",
  #                                state: "WA",
  #                                zip: "98101")
  #
  #     meredith = general.doctors.create!(name: "Meredith Grey",
  #                                        specialty: "General Surgery",
  #                                        education: "Harvard University")
  #     mcdreamy = general.doctors.create!(name: "Derek McDreamy Shepherd",
  #                                        specialty: "Attending Surgeon",
  #                                        education: "University of Pennsylvania")
  #
  #


end 




# I see the names of all that hospital's patients listed from oldest to youngest

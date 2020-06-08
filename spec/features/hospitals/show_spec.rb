require "rails_helper"

RSpec.describe "when visiting a hospitals show page" do
  before :each do
    @greys = Hospital.create!(name: "Grey Sloan Memorial Hospital",
    address: "123 Save Lives Rd",
    city: "Seattle",
    state: "WA",
    zip: 98101)


    @meredith = @greys.doctors.create!(name: "Meredith Grey",
                              specialty: "General Surgery",
                              education: "Harvard University")

    @alex = @greys.doctors.create!(name: "Alex Karev",
                              specialty: "Pediatric Surgery",
                              education: "Johns Hopkins University")

    @miranda = @greys.doctors.create!(name: "Miranda Bailey",
                              specialty: "General Surgery",
                              education: "Stanford University")
  end

  it "a visitor sees the hospitals info, # of doctors, list of universities docs attended" do
    visit "/hospitals/#{@greys.id}"

    expect(page).to have_content(@greys.name)
    expect(page).to have_content(@greys.address)
    expect(page).to have_content(@greys.city)
    expect(page).to have_content(@greys.state)
    expect(page).to have_content(@greys.zip)

    expect(page).to have_content(@greys.number_of_doctors)
    expect(page).to have_content(@greys.doctors.first.education)
    expect(page).to have_content(@greys.doctors.last.education)
  end

  it "a visitor can click a link that will take them to patients index page" do
    visit "/hospitals/#{@greys.id}"

    click_link "View Patients"

    expect(current_path).to eq("/hospitals/#{@greys.id}/patients")
  end
end
# ```
# User Story 3, Hospital Patient Index Page
# As a visitor
# When I visit the hospitals show page
# I see a link to view all of that hospitals patients
# When I click that link
# I'm taken to a patients index page for that hospital
# I see the names of all that hospital's patients listed from oldest to youngest
# ```

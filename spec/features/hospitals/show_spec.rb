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
    save_and_open_page
  end
end
# User Story 2, Hospital S'ow Page
# "As a visitor
# When I visit a hospital's show "ag'
# I see the hospital's name,'street address, city, state, and zip
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended
# ```

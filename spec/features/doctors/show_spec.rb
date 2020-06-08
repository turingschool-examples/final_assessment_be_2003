require 'rails_helper'
RSpec.describe "when visiting a doctors show page" do
  before :each do
    @greys = Hospital.create!(name: "Grey Sloan Memorial Hospital",
    address: "123 Save Lives Rd",
    city: "Seattle",
    state: "WA",
    zip: 98101)

    @seaside = Hospital.create!(name: "Seaside Health & Wellness Center",
    address: "123 Private Practice Road",
    city: "Los Angeles",
    state: "CA",
    zip: 90001)


    @meredith = @greys.doctors.create!(name: "Meredith Grey",
                              specialty: "General Surgery",
                              education: "Harvard University")


    @katie = @meredith.patients.create!(name: "Katie Bryce",
                                        age: 24)
    @denny = @meredith.patients.create!(name: "Denny Duquette",
                                        age: 39)
    @rebecca = @meredith.patients.create!(name: "Rebecca Pope",
                                          age: 32)
  end
  it "a visitor will see all doctors info, hospital & patients" do
    visit "/doctors/#{@meredith.id}"

    expect(page).to have_content(@meredith.name)
    expect(page).to have_content(@meredith.specialty)
    expect(page).to have_content(@meredith.education)
    expect(page).to have_content(@meredith.hospital.name)
    expect(page).to have_content(@meredith.patients.first.name)
    expect(page).to have_content(@meredith.patients.last.name)
  end

  it "a visitor will see all doctors info, hospital & patients" do
    visit "/doctors/#{@meredith.id}"
    within(:css, "li##{@katie.id}") do
      click_on "Remove Patient"
    end

    expect(current_path).to eq("/doctors/#{@meredith.id}")
    expect(page).to_not have_content(@katie.name)
    expect(page).to have_content(@denny.name)
  end

  it "a visitor will see all doctors info, hospital & patients" do
    visit "/doctors/#{@meredith.id}"

    click_link "Assign #{@meredith.name} to a Different Hospital"
    expect(current_path).to eq("/doctors/#{@meredith.id}/edit")

    fill_in :hospital_id, with: @seaside.id

    click_on "Add #{@meredith.name} to this hospital"
    expect(current_path).to eq("/doctors/#{@meredith.id}")

    expect(page).to have_content(@seaside.name)
  end
end
# ```
# User Story 6, Reassign Doctor to Different Hospital
# As a visitor
# When I visit a doctor's show page
# Next to the name of the hospital where this doctor works
# I see a link that says "Assign <insert name of doctor> to a Different Hospital"
# When I click on that link
# I'm taken to a form where I can input an id of an existing hospital
# When I click "Add <insert name of doctor> to this hospital"
# I'm taken back to that doctor's show page
# And I can see the name of the new hospital that they were assigned to
# ```

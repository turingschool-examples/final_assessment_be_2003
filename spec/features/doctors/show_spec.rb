require 'rails_helper'
RSpec.describe "when visiting a doctors show page" do
  before :each do
    @greys = Hospital.create!(name: "Grey Sloan Memorial Hospital",
    address: "123 Save Lives Rd",
    city: "Seattle",
    state: "WA",
    zip: 98101)


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

end

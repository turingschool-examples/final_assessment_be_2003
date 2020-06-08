require 'rails_helper'

RSpec.describe 'new doctor form page', type: :feature do
  before(:each) do
    @greys = Hospital.create(name:"Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "Washington", zip: "98101")

    @meredith = @greys.doctors.create(name: "Meredith Grey", specialty: "general surgery", school: "Turing")
  end

  it "shows doctor's information (name,specialty,school,hospital,patients)" do
    visit "/hospitals/#{@greys.id}"

    expect(page).to have_content("Doctors on staff: 1")
    click_link "add new doctor"

    expect(current_path).to eq("/hospitals/#{@greys.id}/new")
    fill_in :name, with: "stacy"
    fill_in :specialty, with: "toe nails"
    fill_in :school, with: "NIU"

    click_button "Hire Doctor"

    expect(current_path).to eq("/hospitals/#{@greys.id}")

    expect(page).to have_content("Doctors on staff: 2")
  end
end

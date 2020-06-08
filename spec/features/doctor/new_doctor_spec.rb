require 'rails_helper'

RSpec.describe "when i visit a hospitals show page" do
  it "shows a link to add a doctor" do

    hospital1 = Hospital.create(name: "Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city:"Seattle", state:"WA", zip: "98101")

    visit "/hospitals/#{hospital1.id}"

    click_on "Create New Doctor"

    expect(current_path).to eq("/hospitals/#{hospital1.id}/doctors/new")

  end

  it "has a title 'New Doctor Hire For <insert hospital name here>'" do

    hospital1 = Hospital.create(name: "Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city:"Seattle", state:"WA", zip: "98101")


    visit "/hospitals/#{hospital1.id}/doctors/new"

    fill_in "Name", with: "Rostam"
    fill_in "Specialty", with: "Surgeon"
    fill_in "Education", with: "ASU"

    click_on "Create Doctor"

    expect(current_path).to eq("/hospitals/#{hospital1.id}")
    
    expect(page).to have_content(1)
    expect(page).to have_content("Asu")

  end


end

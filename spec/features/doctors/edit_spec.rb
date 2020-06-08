require 'rails_helper'

RSpec.describe 'doctor edit page', type: :feature do
  before(:each) do
    @greys = Hospital.create(name:"Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "Washington", zip: "98101")
    @seaside = Hospital.create(name:"Seaside Health & Wellness Center", address: "123 Private Practice Rd", city: "LA", state: "California", zip: "90210")

    @meredith = @greys.doctors.create(name: "Meredith Grey", specialty: "general surgery", school: "Turing")
  end

  it "reassigns a doctor to new hospital via provided hospital id" do
    visit "/doctors/#{@meredith.id}"

    expect(page).to have_content("works at: Grey Sloan Memorial Hospital")
    click_link "Assign #{@meredith.name} to a Different Hospital"

    expect(current_path).to eq("/doctors/#{@meredith.id}/edit")
    fill_in :hospital_id, with: @seaside.id

    click_button "Add #{@meredith.name} to this hospital"

    expect(current_path).to eq("/doctors/#{@meredith.id}")
    expect(page).to have_content("works at: Seaside Health & Wellness Center")
  end
end

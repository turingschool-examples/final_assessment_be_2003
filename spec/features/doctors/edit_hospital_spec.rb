require 'rails_helper'

RSpec.describe "Update a doctor's workplace" do
  it "I can reassign a doctor to a different hospital using a form" do
    memorial = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    seaside = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

    karev = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: memorial.id)

    visit "/doctors/#{karev.id}"

    click_link "Assign Alex Karev to a Different Hospital"

    expect(current_path).to eq("/doctors/#{karev.id}/edit")
    fill_in :hospital_id, with: "#{seaside.id}"
    click_on "Add Alex Karev to this hospital"

    visit "/doctors/#{karev.id}"

    expect(page).to have_content("Work: Seaside Health & Wellness Center")
  end
end

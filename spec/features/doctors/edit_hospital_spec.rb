require 'rails_helper'

RSpec.describe "Update a doctor's workplace" do
  xit "I can reassign a doctor to a different hospital using a form" do
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

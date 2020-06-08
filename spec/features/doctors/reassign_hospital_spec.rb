require "rails_helper"

RSpec.describe "From the doctor show" do
  it "I reassign them to a different hospital" do
    grey = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    seaside = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")
    meridith  = grey.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    visit doctor_path(meridith.id)
    click_link "Assign #{meridith.name} to a Different Hospital"
    expect(current_path).to eq("/doctors/#{meridith.id}/edit")
    fill_in "New Hospital ID", with: seaside.id
    click_on "Add #{meridith.name} to this hospital"
    expect(current_path).to eq(doctor_path(meridith.id))
    expect(page).to have_content seaside.name
    expect(page).to_not have_content grey.name
  end

  it "Must be a valid hospital id" do
    grey = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    meridith  = grey.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    visit doctor_path(meridith.id)
    click_link "Assign #{meridith.name} to a Different Hospital"
    expect(current_path).to eq("/doctors/#{meridith.id}/edit")
    fill_in "New Hospital ID", with: "hello"
    click_on "Add #{meridith.name} to this hospital"
    expect(page).to have_content "hello is not a valid hospital id"
    expect(page).to have_content "Add #{meridith.name} to this hospital"
  end

end

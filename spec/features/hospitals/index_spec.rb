require "rails_helper"

RSpec.describe "Hospital index page" do
  it "has all of the hospitals names as links to their show" do
    grey = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    seaside = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

    visit root_path
    expect(page).to have_content(seaside.name)
    click_link(grey.name)
    expect(current_path).to eq(hospital_path(grey.id))
  end

end

require 'rails_helper'

describe 'Doctor reassign page' do
  it "can reassign a doctor to a different hospital" do
    grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital",
                                 address: "123 Save Lives Rd",
                                 city: "Seattle",
                                 state: "WA",
                                 zip: "98101")

    seaside = Hospital.create(name: "Seaside Health & Wellness Center",
                              address: "123 Private Practice Rd",
                              city: "Los Angeles",
                              state: "CA",
                              zip: "90001")

    meredith = Doctor.create(name: "Meredith Grey",
                             specialty: "General Surgery",
                             education: "Harvard University",
                             hospital_id: grey_sloan.id)

    visit doctor_path(meredith.id)
    click_link "Assign #{meredith.name} to a Different Hospital"
    expect(current_path).to eq(edit_doctor_path(meredith.id))

    fill_in :hospital_id, with: seaside.id
    click_button "Add #{meredith.name} to this hospital"

    expect(current_path).to eq(doctor_path(meredith.id))
    expect(page).to have_content(seaside.name)
    expect(page).to_not have_content(grey_sloan.name)

  end
end

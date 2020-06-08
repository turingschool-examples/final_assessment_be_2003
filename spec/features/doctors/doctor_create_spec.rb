require 'rails_helper'

describe 'Doctor new page' do
  it "creates a new doctor" do
    grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital",
                                 address: "123 Save Lives Rd",
                                 city: "Seattle",
                                 state: "WA",
                                 zip: "98101")

    visit hospital_path(grey_sloan.id)
    expect(page).to have_content("Number of doctors on staff: 0")
    click_button "Add Doctor"

    expect(current_path).to eq(new_hospital_doctor_path(grey_sloan.id))
    expect(page).to have_content("New Doctor Hire for #{grey_sloan.name}")

    fill_in :doctor_name, with: "Meredith Grey"
    fill_in :doctor_specialty, with: "General Surgery"
    fill_in :doctor_education, with: "Harvard University"
    click_button "Submit Doctor"

    expect(current_path).to eq(hospital_path(grey_sloan.id))
    expect(page).to have_content("Number of doctors on staff: 1")
  end
end

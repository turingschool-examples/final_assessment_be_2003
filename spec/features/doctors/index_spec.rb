require "rails_helper"

RSpec.describe "Doctor index page" do
  it "user can get to a hospitals doctors from the hospital show" do
    grey = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    meridith = grey.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    grey.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
    grey.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Harvard University")

    visit hospital_path(grey.id)

    click_on "Number of Doctors: 3"
    expect(current_path).to eq(hospital_doctors_path(grey.id))
    expect(page).to have_content("Miranda Bailey")
    expect(page).to have_content("Alex Karev")
    click_link "#{meridith.name}"
    expect(current_path).to eq(doctor_path(meridith.id))
  end

end

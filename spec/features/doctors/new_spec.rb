require 'rails_helper'

RSpec.describe "Create New Doctor" do
  describe "from a hospital's show page" do
    it "can click link to add doctor to hospital" do
      grey = Hospital.create(name:"Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      meredith = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: grey.id)

      visit "/hospitals/#{grey.id}"
      click_link "Add Doctor"

      expect(current_path).to eq("/hospitals/#{grey.id}/doctors/new")

      fill_in "Name", with: "New Doctor"
      fill_in "Specialty", with: "Doctor Things"
      fill_in "Education", with: "Doctor School"

      click_on "Submit"
      expect(current_path).to eq("/hospitals/#{grey.id}")
      expect(page).to have_content("Number of Doctors: 2")
    end
  end
end
# User Story 4, Creating a Doctor 

# As a visitor
# When I visit a hospital's show page
# I see a link to add a doctor for this hospital
# When I click that link
# I'm taken to a page that has a title of "New Doctor Hire for <insert hospital name here>"
# And on that page there's a form for me to enter a new doctor's name, specialty, and university where they got their doctorate.
# When I fill out all three fields and click submit
# I am taken back to the hospital show page 
# And I can see that the number of doctors has increased by one
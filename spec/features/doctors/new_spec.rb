require "rails_helper"

RSpec.describe "New Doctor Page", type: :feature do
  it "Can create a new doctor" do
    hospital_2 = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: 98101})
    visit "/hospitals/#{hospital_2.id}"
    expect(page).to have_content("Number of Doctors: 0")
    click_link "Create Doctor"
    expect(current_path).to eql("/hospitals/#{hospital_2.id}/doctors/new")
    expect(page).to have_content("New Doctor Hire for #{hospital_2.name}")
    fill_in :name, with: "Fred"
    fill_in :specialty, with: "Family Medicine"
    fill_in :education, with: "Harvard"
    click_on "Submit"
    expect(current_path).to eql("/hospitals/#{hospital_2.id}")
    expect(page).to have_content("Number of Doctors: 1")
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

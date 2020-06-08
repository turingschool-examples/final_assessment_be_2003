require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe "When I visit a hospital's show page" do 
    before(:each) do
      @grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101" )
      @seaside_health = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

      @grey = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: @grey_sloan.id)
      @karev = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: @seaside_health.id)
      @bailey = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: @seaside_health.id)
      @shepherd = Doctor.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: @grey_sloan.id)
    end

    it "I see all the information for that hospital" do 
      visit"/hospitals/#{@grey_sloan.id}"

      expect(page).to have_content(@grey_sloan.name) 
      expect(page).to have_content(@grey_sloan.address) 
      expect(page).to have_content(@grey_sloan.city) 
      expect(page).to have_content(@grey_sloan.state) 
      expect(page).to have_content(@grey_sloan.zip) 
      expect(page).to have_content("Doctors: 2") 
      expect(page).to have_content("Educational Background at this hospital:")
      expect(page).to have_content(@grey.education)
      expect(page).to have_content(@shepherd.education)
    end

    it "I see a link to add a doctor for this hospital" do 
      visit"/hospitals/#{@grey_sloan.id}"

      click_link("Hire New Doctor") 

      expect(current_path).to eq("/hospitals/#{@grey_sloan.id}/doctorApp")
      
      expect(page).to have_content("New Doctor Hire for #{@grey_sloan.name}") 

      fill_in "Name",	with: "Mark Sloan" 
      fill_in "Specialty",	with: "Plastics Attending" 
      fill_in "Education",	with: "Harvard University" 

      click_button("Submit Application")

      expect(current_path).to eq("/hospitals/#{@grey_sloan.id}")
      expect(page).to have_content("Doctors: 3")
      save_and_open_page
    end
  end
end
# "As a visitor
# When I visit a hospital's show page
# I see the hospital's name,street address, city, state, and zip
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended

# As a visitor
# When I visit a hospital's show page
# I see a link to add a doctor for this hospital
# When I click that link
# I'm taken to a page that has a title of "New Doctor Hire for <insert hospital name here>"
# And on that page there's a form for me to enter a new doctor's name, specialty, and university where they got their doctorate.
# When I fill out all three fields and click submit
# I am taken back to the hospital show page 
# And I can see that the number of doctors has increased by one
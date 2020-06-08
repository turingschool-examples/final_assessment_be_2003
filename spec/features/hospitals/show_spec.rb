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
  end
end
# "As a visitor
# When I visit a hospital's show page
# I see the hospital's name,street address, city, state, and zip
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended
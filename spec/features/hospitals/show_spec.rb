require 'rails_helper'

RSpec.describe 'Hospital Show Page' do
  describe 'As a visitor' do
    before :each do
      @hospital = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      @psych = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")
      @grey = @hospital.doctors.create(name: "Meredith Grey", speciality: "General Surgery", education: "Harvard University")
      @karev = @hospital.doctors.create(name: "Alex Karev", speciality: "Pediatric Surgery", education: "Johns Hopkins University")
      @bunny = @psych.doctors.create(name: "Bugs Bunny", speciality: "Carrot Surgery", education: "Looney Tunes University")
    end

    it "I can see the hospital's information, doctors, and unique universities doctors attended" do
      visit "/hospitals/#{@hospital.id}"

      expect(page).to have_content(@hospital.name)
      expect(page).to have_content(@hospital.address)
      expect(page).to have_content(@hospital.city)
      expect(page).to have_content(@hospital.state)
      expect(page).to have_content(@hospital.zip)
      expect(page).to have_content("Doctors: 2")
      expect(page).to have_content(@grey.education)
      expect(page).to have_content(@karev.education)

      expect(page).to_not have_content(@psych.name)
      expect(page).to_not have_content(@psych.address)
      expect(page).to_not have_content(@psych.city)
      expect(page).to_not have_content(@psych.state)
      expect(page).to_not have_content(@psych.zip)
      expect(page).to_not have_content("Doctors: 1")
      expect(page).to_not have_content("Doctors: 3")
      expect(page).to_not have_content(@bunny.education)
    end
  end
end

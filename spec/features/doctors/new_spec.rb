require 'rails_helper'

RSpec.describe 'Create New Doctor' do
  describe 'As a visitor' do
    before :each do
      @hospital = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      @grey = @hospital.doctors.create(name: "Meredith Grey", speciality: "General Surgery", education: "Harvard University")
      @karev = @hospital.doctors.create(name: "Alex Karev", speciality: "Pediatric Surgery", education: "Johns Hopkins University")
    end

    it "I can get to a new doctor form from hospital show page" do
      visit "/hospitals/#{@hospital.id}"

      click_link "Add New Doctor"

      expect(current_path).to eq("/hospitals/#{@hospital.id}/doctors/new")
    end

    it "I can fill out a form and create a new doctor" do
      visit "/hospitals/#{@hospital.id}/doctors/new"

      expect(page).to have_content("New Doctor Hire for #{@hospital.name}")

      fill_in :name, with: "Elmer Fudd"
      fill_in :speciality, with: "Hunting"
      fill_in :education, with: "Looney Tunes University"

      click_button "Create New Doctor"

      expect(current_path).to eq("/hospitals/#{@hospital.id}")

      expect(page).to have_content("Doctors: 3")
    end

    it "I see an error message if I don't fill in the form completely" do
      visit "/hospitals/#{@hospital.id}/doctors/new"

      fill_in :name, with: "Elmer Fudd"
      fill_in :speciality, with: "Hunting"

      click_button "Create New Doctor"

      expect(current_path).to eq("/hospitals/#{@hospital.id}/doctors/new")
      expect(page).to have_content("Fill in all the blanks and try submitting again.")
    end
  end
end

require 'rails_helper'

RSpec.describe "Doctor New Page" do
  describe "When I visit the hospital's show page" do
    before(:each) do
      @sloan = Hospital.create!(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      @seaside = Hospital.create!(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")
    end

    it "I see a link to add a doctor for that hospital" do
      visit "/hospitals/#{@sloan.id}"

      click_on("Add a Doctor")
      expect(current_path).to eq("/hospitals/#{@sloan.id}/doctors/new")
      expect(page).to have_content("New Doctor Hire for Grey Sloan Memorial Hospital")
      fill_in :name, with: "Meredith Grey"
      fill_in :specialty, with: "General Surgery"
      fill_in :education, with: "Harvard University"
      click_on "Submit"

      expect(current_path).to eq("/hospitals/#{@sload.id}")
      expect(page).to have_content("Number of Doctors: 1")
    end
  end
end

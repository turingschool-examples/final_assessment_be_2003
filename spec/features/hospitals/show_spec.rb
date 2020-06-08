require 'rails_helper'

RSpec.describe "Hospital Show Page", type: :feature do
  describe "when I visit /hospitals/:id" do
    before(:each) do
      @unmh = Hospital.create!(name: "UNM Hospital", address: "2211 Lomas Blvd. NE", city: "Albuquerque", state: "NM", zip: 87106)
      @anschutz = Hospital.create!(name: "CU Anschutz Medical Center", address: "13001 East 17th Place", city: "Aurora", state: "CO", zip: 80045)
      @doctor_1 = @unmh.doctors.create!(name: "S. Santos", specialty: "Pediatrics", education: "Cornell")
      @doctor_2 = @unmh.doctors.create!(name: "V. Santos", specialty: "Pediatrics", education: "UNAM")
      @doctor_3 = @unmh.doctors.create!(name: "E. Santos", specialty: "Pediatrics", education: "Cornell")
      @doctor_4 = @anschutz.doctors.create!(name: "T. Fernandes", specialty: "Oncology", education: "Harvard")

      visit "/hospitals/#{@unmh.id}"
    end

    it "I see that hospital's information" do
      expect(page).to have_content("UNM Hospital")
      expect(page).to have_content(@unmh.address)
      expect(page).to have_content("Albuquerque")
      expect(page).to have_content ("NM")
      expect(page).to have_content(@unmh.zip)
      expect(page).to_not have_content(@anschutz.name)
    end

    it "I can see the total count of doctors at that hospital" do
      expect(page).to have_content("Number of Doctors at this Hospital: 3")
    end

    it "I see a list of universities that the doctor's attended" do
      expect(page).to have_content("Cornell")
      expect(page).to have_content("UNAM")
    end

    it "I can click on a link that takes me to that hospital's list of patients" do
      click_link("Patients")

      expect(current_path).to eq("/hospitals/#{@unmh.id}/patients")
    end
  end
end

# User Story 3, Hospital Patient Index Page
# As a visitor
# When I visit the hospitals show page
# I see a link to view all of that hospitals patients
# When I click that link
# I'm taken to a patients index page for that hospital
# I see the names of all that hospital's patients listed from oldest to youngest


# User Story 2, Hospital Show Page
# "As a visitor
# When I visit a hospital's show page
# I see the hospital's name, street address, city, state, and zip
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended

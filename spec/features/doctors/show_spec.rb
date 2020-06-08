require 'rails_helper'

RSpec.describe "Doctor Show Page", type: :feature do
  describe "when I visit /doctors/:id" do
    before(:each) do
      @anschutz = Hospital.create!(name: "CU Anschutz Medical Center", address: "13001 East 17th Place", city: "Aurora", state: "CO", zip: 80045)
      @unmh = Hospital.create!(name: "UNM Hospital", address: "2211 Lomas Blvd. NE", city: "Albuquerque", state: "NM", zip: 87106)
      @doctor_1 = @anschutz.doctors.create!(name: "T. Fernandes", specialty: "Oncology", education: "Harvard")
      @doctor_2 = @unmh.doctors.create!(name: "S. Santos", specialty: "Pediatrics", education: "Cornell")
      @patient_a = @doctor_1.patients.create!(name: "A", age: 20)
      @patient_b = @doctor_1.patients.create!(name: "B", age: 57)
      @patient_c = @doctor_2.patients.create!(name: "C", age: 12)

      visit "/doctors/#{@doctor_1.id}"
    end

    it "I see that doctor's information" do
      expect(page).to have_content("Doctor: T. Fernandes")
      expect(page).to have_content("Specialty: Oncology")
      expect(page).to have_content("Education: Harvard")
      expect(page).to have_content ("Place of Employment: CU Anschutz Medical Center")
      expect(page).to_not have_content("Doctor: S. Santos")
    end

    it "I see a list of the doctor's patients" do
      expect(page).to have_content("Name: #{@patient_a.name}")
      expect(page).to have_content("Name: #{@patient_b.name}")
      expect(page).to_not have_content("Name: #{@patient_c.name}")
    end
  end
end

# User Story 1, Doctors Show Page
# 'As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
#  - name
#  - specialty
#  - university where they got their doctorate

# And I see the name of the hospital where this doctor works

# And I see the names of all of the patients this doctor has

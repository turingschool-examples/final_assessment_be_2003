require 'rails_helper'

RSpec.describe "Hospital Patients Index Page" do
  describe "when I visit the hospital patients index page" do
    it "shows me a list of the patients for that hospital" do
      unmh = Hospital.create!(name: "UNM Hospital", address: "2211 Lomas Blvd. NE", city: "Albuquerque", state: "NM", zip: 87106)
      doctor_1 = unmh.doctors.create!(name: "S. Santos", specialty: "Pediatrics", education: "Cornell")
      doctor_2 = unmh.doctors.create!(name: "V. Santos", specialty: "Pediatrics", education: "UNAM")
      patient_a = doctor_1.patients.create!(name: "A", age: 10)
      patient_b = doctor_2.patients.create!(name: "B", age: 5)

      visit "/hospitals/#{unmh.id}/patients"

      expect(page).to have_content(unmh.name)

      within "#patient-#{patient_a.id}" do
        expect(page).to have_content("Name: #{patient_a.name}")
        expect(page).to have_content("Age: #{patient_a.age}")
      end

      within "#patient-#{patient_b.id}" do
        expect(page).to have_content("Name: #{patient_b.name}")
        expect(page).to have_content("Age: #{patient_b.age}")
      end
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

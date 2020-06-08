require 'rails_helper'

RSpec.describe "Doctor Show Page" do
  describe "When I visit the doctor's show page" do
    before(:each) do
      @sloan = Hospital.create!(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      @seaside = Hospital.create!(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

      @grey = @sloan.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
      @karev = @sloan.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
      @bailey = @sloan.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
      @shepherd = @seaside.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")

      @bryce = Patient.create!(name: "Katie Bryce", age: 24)
      @duquette = Patient.create!(name: "Denny Duquette", age: 39)
      @pope = Patient.create!(name: "Rebecca Pope", age: 32)
      @zola = Patient.create!(name: "Zola Shepherd", age: 2)

      DoctorPatient.create!(doctor: @grey, patient: @bryce)
      DoctorPatient.create!(doctor: @grey, patient: @duquette)
      DoctorPatient.create!(doctor: @karev, patient: @duquette)
      DoctorPatient.create!(doctor: @bailey, patient: @pope)
      DoctorPatient.create!(doctor: @shepherd, patient: @zola)
    end

    it "I see that doctor's name, specialty, university, hospital and patients" do
      visit "/doctors/#{@grey.id}"

      expect(page).to have_content("Meredith Grey")
      expect(page).to have_content("Specialty: General Surgery")
      expect(page).to have_content("University: Harvard University")
      expect(page).to have_content("Hospital: Grey Sloan Memorial Hospital")
      expect(page).to have_content("Katie Bryce")
      expect(page).to have_content("Denny Duquette")
      expect(page).to_not have_content("Name: Alex Karev")
      expect(page).to_not have_content("Rebecca Pope")
    end

    it "I can remove a patient from that doctor" do
      visit "/doctors/#{@grey.id}"

      within "#patient-#{@bryce.id}" do
        click_on "Remove This Patient from Caseload"
      end

      expect(current_path).to eq("/doctors/#{@grey.id}")
      expect(page).to_not have_content("Katie Bryce")
      expect(page).to have_content("Denny Duquette")
    end

    it "I can reassign a doctor to a different hospital" do
      visit "/doctors/#{@grey.id}"

      click_on "Assign Meredith Grey to a Different Hospital"

      expect(current_path).to eq("/doctors/#{@grey.id}/edit")

      fill_in :hospital_id, with: @seaside.id
      click_on "Add Meredith Grey to this hospital"

      expect(current_path).to eq("/doctors/#{@grey.id}")
      expect(page).to have_content("Hospital: Seaside Health & Wellness Center")
      expect(page).to_not have_content("Hospital: Grey Sloan Memorial Hospital")
    end
  end
end

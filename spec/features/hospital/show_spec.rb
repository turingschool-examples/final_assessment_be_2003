require 'rails_helper'

RSpec.describe "Hospital Show Page" do
  describe "When I visit the hospital's show page" do
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

    it "I see that hospital's name, address, city, state, zip, doctors, and affiliated universities" do
      visit "/hospitals/#{@sloan.id}"

      expect(page).to have_content("Grey Sloan Memorial Hospital")
      expect(page).to have_content("123 Save Lives Rd")
      expect(page).to have_content("Seattle WA 98101")
      expect(page).to have_content("Meredith Grey")
      expect(page).to have_content("Alex Karev")
      expect(page).to have_content("Miranda Bailey")
      expect(page).to have_content("Harvard University")
      expect(page).to have_content("Johns Hopkins University")
      expect(page).to have_content("Stanford University")
      expect(page).to_not have_content("Derek McDreamy Shepherd")
      expect(page).to_not have_content("University of Pennsylvania")
    end
  end
end

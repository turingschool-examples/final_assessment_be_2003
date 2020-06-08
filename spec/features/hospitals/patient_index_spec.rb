require 'rails_helper'

RSpec.describe 'Hospital Patient Index Page' do
  describe 'As a visitor' do
    before :each do
      @hospital = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      @psych = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")
      @grey = @hospital.doctors.create(name: "Meredith Grey", speciality: "General Surgery", education: "Harvard University")
      @karev = @hospital.doctors.create(name: "Alex Karev", speciality: "Pediatric Surgery", education: "Johns Hopkins University")
      @bunny = @psych.doctors.create(name: "Bugs Bunny", speciality: "Carrot Surgery", education: "Looney Tunes University")
      @katie = Patient.create(name: "Katie Bryce", age: 24)
      @denny = Patient.create(name: "Denny Duquette", age: 39)
      @rebecca = Patient.create(name: "Rebecca Pope", age: 32)
      @tweety = Patient.create(name: "Tweety Bird", age: 5)
      DoctorPatient.create(doctor_id: @grey.id, patient_id: @katie.id)
      DoctorPatient.create(doctor_id: @karev.id, patient_id: @katie.id)
      DoctorPatient.create(doctor_id: @grey.id, patient_id: @denny.id)
      DoctorPatient.create(doctor_id: @grey.id, patient_id: @rebecca.id)
      DoctorPatient.create(doctor_id: @bunny.id, patient_id: @tweety.id)
    end

    it "I can see a list of the names of all patients at the hospital, in order of age" do
      visit "/hospitals/#{@hospital.id}"

      click_link "View All Patients"

      expect(page).to have_content(@katie.name, count: 1)
      expect(@katie.name).to appear_before(@rebecca.name)
      expect(@rebecca.name).to appear_before(@denny.name)

      expect(page).to_not have_content(@tweety.name)
    end
  end
end

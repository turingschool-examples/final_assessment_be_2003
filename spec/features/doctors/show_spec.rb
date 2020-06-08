require 'rails_helper'

RSpec.describe 'Doctor Show Page' do
  describe 'As a visitor' do
    before :each do
      @hospital = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      @grey = @hospital.doctors.create(name: "Meredith Grey", speciality: "General Surgery", education: "Harvard University")
      @karev = @hospital.doctors.create(name: "Alex Karev", speciality: "Pediatric Surgery", education: "Johns Hopkins University")
      @katie = Patient.create(name: "Katie Bryce", age: 24)
      @denny = Patient.create(name: "Denny Duquette", age: 39)
      @rebecca = Patient.create(name: "Rebecca Pope", age: 32)
      DoctorPatient.create(doctor_id: @grey.id, patient_id: @katie.id)
      DoctorPatient.create(doctor_id: @karev.id, patient_id: @katie.id)
      DoctorPatient.create(doctor_id: @grey.id, patient_id: @denny.id)
      DoctorPatient.create(doctor_id: @grey.id, patient_id: @rebecca.id)
    end

    it "I see all of that doctor's information, the name of their hospital, and names of patients" do
      visit "/doctors/#{@karev.id}"

      expect(page).to have_content(@karev.name)
      expect(page).to have_content(@karev.speciality)
      expect(page).to have_content(@karev.education)
      expect(page).to have_content(@karev.hospital.name)
      expect(page).to have_content(@katie.name)

      expect(page).to_not have_content(@grey.name)
      expect(page).to_not have_content(@grey.speciality)
      expect(page).to_not have_content(@grey.education)
      expect(page).to_not have_content(@grey.hospital)
      expect(page).to_not have_content(@denny.name)
      expect(page).to_not have_content(@rebecca.name)
    end
  end
end

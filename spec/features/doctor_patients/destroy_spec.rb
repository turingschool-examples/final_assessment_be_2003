require 'rails_helper'

RSpec.describe 'Destroy Doctor Patient Relationship' do
  describe 'As a visitor' do
    before :each do
      @hospital = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      @grey = @hospital.doctors.create(name: "Meredith Grey", speciality: "General Surgery", education: "Harvard University")
      @katie = Patient.create(name: "Katie Bryce", age: 24)
      @denny = Patient.create(name: "Denny Duquette", age: 39)
      @rebecca = Patient.create(name: "Rebecca Pope", age: 32)
      DoctorPatient.create(doctor_id: @grey.id, patient_id: @katie.id)
      DoctorPatient.create(doctor_id: @grey.id, patient_id: @denny.id)
      DoctorPatient.create(doctor_id: @grey.id, patient_id: @rebecca.id)
    end

    it "I can remove a patient from a doctor's caseload on the doctor's show page" do
      visit "/doctors/#{@grey.id}"

      within ".patient-#{@denny.id}" do
        click_link "Remove Patient From Caseload"
      end 

      expect(current_path).to eq("/doctors/#{@grey.id}")
      expect(page).to_not have_content("#{@denny.name}")
      expect(page).to have_content("#{@katie.name}")
      expect(page).to have_content("#{@rebecca.name}")
    end
  end
end

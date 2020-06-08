require 'rails_helper'

RSpec.describe 'Doctor Patient Remove' do
  describe 'As a visitor' do
    before :each do
      @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")

      @doctor1 = @hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
      @doctor2 = @hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")

      @patient1 = Patient.create!(name: "Katie Bryce", age: 24)
      @patient2 = Patient.create!(name: "Denny Duquette", age: 39)
      @patient3 = Patient.create!(name: "Rebecca Pope", age: 32)
      @patient4 = Patient.create!(name: "Zola  Shepherd", age: 2)

      @doctor_patient1 = DoctorPatient.create!(doctor: @doctor1, patient: @patient1)
      @doctor_patient2 = DoctorPatient.create!(doctor: @doctor1, patient: @patient2)
      @doctor_patient3 = DoctorPatient.create!(doctor: @doctor2, patient: @patient3)
      @doctor_patient4 = DoctorPatient.create!(doctor: @doctor2, patient: @patient4)
    end

    it 'I see a link next to each patient to remove patient from doctors workload' do
      visit doctor_path(@doctor1)

      within "#patient-#{@patient1.id}" do
        expect(page).to have_link("Remove Patient")
      end

      within "#patient-#{@patient2.id}" do
        expect(page).to have_link("Remove Patient")
      end
    end

    it 'When I click to remove patient, Im brought back to show page and no longer see that patient' do
      visit doctor_path(@doctor1)

      within "#patient-#{@patient1.id}" do
        click_link "Remove Patient"
      end

      expect(current_path).to eq(doctor_path(@doctor1))
      expect(page).to_not have_content(@patient1.name)
    end
  end
end

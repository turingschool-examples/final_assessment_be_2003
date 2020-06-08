require 'rails_helper'

RSpec.describe 'Doctor Show Page' do
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

    it 'I see doctor name, specialty, and university' do
      visit doctor_path(@doctor1)

      expect(page).to have_content(@doctor1.name)
      expect(page).to have_content("Specialty: #{@doctor1.specialty}")
      expect(page).to have_content("University: #{@doctor1.education}")

      expect(page).to_not have_content("University: #{@doctor2.education}")
    end

    it 'I see the name of the hospital where this doctor works' do
      visit doctor_path(@doctor1)

      expect(page).to have_content("Hospital: #{@hospital1.name}")
    end

    it 'I see the names of all the patients this doctor has' do
      visit doctor_path(@doctor1)


      within "#patient-#{@patient1.id}" do
        expect(page).to have_content(@patient1.name)
      end

      within "#patient-#{@patient2.id}" do
        expect(page).to have_content(@patient2.name)
      end
    end
  end
end

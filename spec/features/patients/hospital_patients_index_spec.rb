require 'rails_helper'

RSpec.describe 'Hospital Patient Index Page' do
  describe 'As a visitor' do
    before :each do
      @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      @hospital2 = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

      @doctor1 = @hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
      @doctor2 = @hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
      @doctor3 = @hospital2.doctors.create!(name: "Tom", specialty: "Pediatric Surgery", education: "Johns Hopkins University")

      @patient1 = Patient.create!(name: "Katie Bryce", age: 24)
      @patient2 = Patient.create!(name: "Denny Duquette", age: 39)
      @patient3 = Patient.create!(name: "Rebecca Pope", age: 32)
      @patient4 = Patient.create!(name: "Zola  Shepherd", age: 2)
      @patient5 = Patient.create!(name: "Tom", age: 15)

      @doctor_patient1 = DoctorPatient.create!(doctor: @doctor1, patient: @patient1)
      @doctor_patient2 = DoctorPatient.create!(doctor: @doctor1, patient: @patient2)
      @doctor_patient3 = DoctorPatient.create!(doctor: @doctor2, patient: @patient3)
      @doctor_patient5 = DoctorPatient.create!(doctor: @doctor3, patient: @patient5)
    end

    it 'I can see a link to a hospitals patients index on hospital show page' do
      visit hospital_path(@hospital1)

      click_link "All Patients"

      expect(current_path).to eq(hospital_patients_path(@hospital1))      
    end

    it 'When I visit patient index, I can see all patients names listed from oldest to youngest' do
      visit "/hospitals/#{@hospital1.id}/patients"

      expect(@patient2.name).to appear_before(@patient3.name)
      expect(@patient3.name).to appear_before(@patient1.name)
    end
  end
end

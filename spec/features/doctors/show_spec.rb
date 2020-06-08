require 'rails_helper'

RSpec.describe "doctors Show Page" do
  describe "When I visit '/doctors/:id'" do
    it "I all doctors info, thier hospital and patients" do
      hospital_1 = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101"})
      doctor_1 = Doctor.create({ name: 'Meredith Grey', specialty: "General Surgery", education: "Harvard University", hospital_id: hospital_1.id})
      patient_1 = Patient.create({name: "Katie Bryce", age: 24})
      patient_2 = Patient.create({name: "Denny Duquette", age: 39})
      DoctorPatient.create({doctor_id: doctor_1.id, patient_id: patient_1.id})
      DoctorPatient.create({doctor_id: doctor_1.id, patient_id: patient_2.id})

      visit "/doctors/#{doctor_1.id}"

      expect(page).to have_content(doctor_1.name)
      expect(page).to have_content(doctor_1.specialty)
      expect(page).to have_content(doctor_1.education)
      expect(page).to have_content(patient_1.name)
      expect(page).to have_content(patient_2.name)
      expect(page).to have_content(hospital_1.name)
    end
  end
end

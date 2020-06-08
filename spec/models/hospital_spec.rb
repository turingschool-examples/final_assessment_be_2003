require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe "relationships" do
    it {should have_many :doctors}
  end
  describe "methods" do
    it "#total_doctors" do
      hospital_1 = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101"})
      doctor_1 = Doctor.create({ name: 'Meredith Grey', specialty: "General Surgery", education: "Harvard University", hospital_id: hospital_1.id})
      doctor_2 = Doctor.create({ name: 'Alex Karev', specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: hospital_1.id})

      expect(hospital_1.total_doctors).to eq(2)
    end
    it "#unique_schools" do
      hospital_1 = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101"})
      doctor_1 = Doctor.create({ name: 'Meredith Grey', specialty: "General Surgery", education: "Harvard University", hospital_id: hospital_1.id})
      doctor_2 = Doctor.create({ name: 'Alex Karev', specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: hospital_1.id})
      doctor_3 = Doctor.create({ name: 'Alex Karev', specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: hospital_1.id})

      expect(hospital_1.unique_schools).to eq(["Harvard University", "Johns Hopkins University"])
    end
    it "#patients" do
      hospital_1 = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101"})
      doctor_1 = Doctor.create({ name: 'Meredith Grey', specialty: "General Surgery", education: "Harvard University", hospital_id: hospital_1.id})
      doctor_2 = Doctor.create({ name: 'Alex Karev', specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: hospital_1.id})
      doctor_3 = Doctor.create({ name: 'Alex Blurv', specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: hospital_1.id})
      patient_1 = Patient.create({name: "Katie Bryce", age: 50})
      patient_2 = Patient.create({name: "Denny Duquette", age: 49})
      patient_3 = Patient.create({name: "Venny Duquette", age: 39})
      patient_4 = Patient.create({name: "Senny Duquette", age: 15})
      DoctorPatient.create({doctor_id: doctor_1.id, patient_id: patient_1.id})
      DoctorPatient.create({doctor_id: doctor_1.id, patient_id: patient_2.id})
      DoctorPatient.create({doctor_id: doctor_2.id, patient_id: patient_2.id})
      DoctorPatient.create({doctor_id: doctor_2.id, patient_id: patient_3.id})
      DoctorPatient.create({doctor_id: doctor_2.id, patient_id: patient_4.id})

      expect(hospital_1.patients).to eq([patient_1, patient_2, patient_3, patient_4])


    end
  end
end

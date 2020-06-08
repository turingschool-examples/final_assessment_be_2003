require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many :doctor_patients }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe 'class methods' do
    it "sort_by_age" do

      hospital1 = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      hospital2 = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

      doctor1 = hospital1.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
      doctor2 = hospital1.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
      doctor3 = hospital2.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
      doctor4 = hospital2.doctors.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")

      patient1 = Patient.create(name: "Katie Bryce", age: 24)
      patient2 = Patient.create(name: "Denny Duquette", age: 39)
      patient3 = Patient.create(name: "Rebecca Pope", age: 32)
      patient4 = Patient.create(name: "Von Miller", age: 28)
      patient5 = Patient.create(name: "Peyton Manning", age: 35)
      patient6 = Patient.create(name: "John Elway", age: 50)
      patient7 = Patient.create(name: "Terrell Davis", age: 40)
      patient8 = Patient.create(name: "Champ Baley", age: 36)

      doctor_patient1 = DoctorPatient.create(doctor: doctor1, patient: patient1)
      doctor_patient2 = DoctorPatient.create(doctor: doctor1, patient: patient2)
      doctor_patient3 = DoctorPatient.create(doctor: doctor2, patient: patient3)
      doctor_patient4 = DoctorPatient.create(doctor: doctor2, patient: patient4)
      doctor_patient5 = DoctorPatient.create(doctor: doctor3, patient: patient5)
      doctor_patient6 = DoctorPatient.create(doctor: doctor3, patient: patient6)
      doctor_patient7 = DoctorPatient.create(doctor: doctor4, patient: patient7)
      doctor_patient8 = DoctorPatient.create(doctor: doctor4, patient: patient8)

      expect(Patient.sort_by_age(hospital1.id,'desc')).to eq([patient2, patient3, patient4, patient1])
      expect(Patient.sort_by_age(hospital2.id,'desc')).to eq([patient6, patient7, patient8, patient5])
    end 
  end
end
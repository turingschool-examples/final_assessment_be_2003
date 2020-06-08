require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'relationships' do
    it { should belong_to :hospital }
    it { should have_many :doctor_patients }
    it { should have_many(:patients).through(:doctor_patients) }
  end
  describe 'class methods' do
    it "sort_by_age" do

      hospital1 = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      doctor1 = hospital1.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")

      patient1 = Patient.create!(name: "Katie Bryce", age: 24)
      patient2 = Patient.create!(name: "Denny Duquette", age: 39)
      patient3 = Patient.create!(name: "Rebecca Pope", age: 32)

      doctor_patient1 = DoctorPatient.create!(doctor: doctor1, patient: patient1)
      doctor_patient2 = DoctorPatient.create!(doctor: doctor1, patient: patient2)
      doctor_patient3 = DoctorPatient.create!(doctor: doctor1, patient: patient3)

      expect(hospital1.doctors.patients_by_age('desc')).to eq([patient2, patient3, patient1])
    end 
  end
end
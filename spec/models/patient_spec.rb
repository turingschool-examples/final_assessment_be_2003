require 'rails_helper'

RSpec.describe Patient do
  describe "relationships" do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe "methods" do
    it "order_by_age" do
      memorial = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")

      karev = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: memorial.id)

      pope = Patient.create(name: "Rebecca Pope", age: 32)
      zola = Patient.create(name: "Zola Shepherd", age: 2)

      DoctorPatient.create(doctor_id: karev.id, patient_id: pope.id)
      DoctorPatient.create(doctor_id: karev.id, patient_id: zola.id)

      expect(Patient.order_by_age).to eq([pope, zola])
    end
  end
end

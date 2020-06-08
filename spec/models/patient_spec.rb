require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe "relationships" do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe "class method" do
    it ".sort_by_age" do
      patients = Patient.all
      unmh = Hospital.create!(name: "UNM Hospital", address: "2211 Lomas Blvd. NE", city: "Albuquerque", state: "NM", zip: 87106)
      doctor_1 = unmh.doctors.create!(name: "S. Santos", specialty: "Pediatrics", education: "Cornell")
      doctor_2 = unmh.doctors.create!(name: "V. Santos",specialty: "Pediatrics", education: "UNAM")
      patient_a = doctor_1.patients.create!(name: "A", age: 2)
      patient_b = doctor_2.patients.create!(name: "B", age: 1)

      expect(patients.sort_by_age.first).to eq(patient_b)
      expect(patients.sort_by_age.last).to eq(patient_a)
    end
  end
end

require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many :doctor_patients }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe 'class methods' do
    it "sort_by_age" do
      patient1 = Patient.create!(name: "Katie Bryce", age: 24)
      patient2 = Patient.create!(name: "Denny Duquette", age: 39)
      patient3 = Patient.create!(name: "Rebecca Pope", age: 32)

      patients = Patient.all

      expect(patients.sort_by_age('desc')).to eq([patient2, patient3, patient1])
    end 
  end
end
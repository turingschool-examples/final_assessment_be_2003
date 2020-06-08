require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
  end

  describe "relationships" do
    it { should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe "methods" do
    it ".order_by_oldest" do
      denny = Patient.create(name: "Denny Duquette", age: 39)
      rebecca = Patient.create(name: "Rebecca Pope", age: 32)
      katie = Patient.create(name: "Katie Bryce", age: 24)
      zola = Patient.create(name: "Zola Shepherd", age: 2)
      patients = Patient.all

      expect(patients.order_by_oldest.first).to eq(denny.name)
      expect(patients.order_by_oldest.last).to eq(zola.name)
    end
  end
end
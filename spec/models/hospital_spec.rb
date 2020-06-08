require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip}
  end

  describe "relationships" do
    it {should have_many :doctors}
  end

  describe "instance methods" do
    it ".list_universities" do
      unmh = Hospital.create!(name: "UNM Hospital", address: "2211 Lomas Blvd. NE", city: "Albuquerque", state: "NM", zip: 87106)
      anschutz = Hospital.create!(name: "CU Anschutz Medical Center", address: "13001 East 17th Place", city: "Aurora", state: "CO", zip: 80045)
      doctor_1 = unmh.doctors.create!(name: "S. Santos", specialty: "Pediatrics", education: "ONE")
      doctor_2 = unmh.doctors.create!(name: "V. Santos", specialty: "Pediatrics", education: "TWO")
      doctor_3 = unmh.doctors.create!(name: "E. Santos", specialty: "Pediatrics", education: "ONE")

      expect(unmh.list_universities).to eq(["ONE", "TWO"])
    end
  end
end

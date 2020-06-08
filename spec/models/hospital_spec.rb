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
  end
end

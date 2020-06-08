require "rails_helper"

RSpec.describe Hospital, type: :model do
  describe "relationships" do
    it {should have_many :doctors}
  end

  describe "instance_methods" do
    it "doctor_count" do
      hospital_2 = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: 98101})
      meredith = Doctor.create({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: "#{hospital_2.id}"})
      alex = Doctor.create({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: "#{hospital_2.id}"})
      expect(hospital_2.doctor_count).to eql(2)
      miranda = Doctor.create({name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: "#{hospital_2.id}"})
      expect(hospital_2.doctor_count).to eql(3)
    end
  end
end

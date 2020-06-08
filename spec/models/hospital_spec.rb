require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'relationships' do
    it { should have_many :doctors }
  end

  describe 'instance methods' do
    it "full_address" do 
      hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")

      expect(hospital1.full_address).to eq("#{hospital1.address} #{hospital1.city}, #{hospital1.state} #{hospital1.zip}")
    end 
    it "count_of_doctors" do 
      hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      hospital2 = Hospital.create!(name: "Hospital 2", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")

      doctor1 = hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
      doctor2 = hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
      doctor3 = hospital1.doctors.create!(name: "Bill", specialty: "Orthopedic Surgery", education: "Johns Hopkins University")
      doctor4 = hospital2.doctors.create!(name: "Tom", specialty: "Pediatric Surgery", education: "Johns Hopkins University")

      expect(hospital1.count_of_doctors).to eq(3)
    end 
    it "unique_universities" do 
      hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      hospital2 = Hospital.create!(name: "Hospital 2", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")

      doctor1 = hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
      doctor2 = hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
      doctor3 = hospital1.doctors.create!(name: "Bill", specialty: "Orthopedic Surgery", education: "Johns Hopkins University")
      doctor4 = hospital2.doctors.create!(name: "Tom", specialty: "Pediatric Surgery", education: "Johns Hopkins University")

      expect(hospital1.unique_universities).to eq(["Harvard University", "Johns Hopkins University"])
    end 
  end
end
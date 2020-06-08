require 'rails_helper'

RSpec.describe Hospital do
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

  describe "#affiliated_universities" do
    it "lists the universities the hospital's doctors attended" do
      sloan = Hospital.create!(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")

      grey = sloan.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
      karev = sloan.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
      bailey = sloan.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")

      expect(sloan.affiliated_universities).to eq("Harvard University, Johns Hopkins University, Stanford University")
    end
  end
end

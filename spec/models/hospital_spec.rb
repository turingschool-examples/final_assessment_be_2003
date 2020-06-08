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

  describe "#doctor_count" do
    it "lists the number of doctors at the hospital" do
      sloan = Hospital.create!(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      seaside = Hospital.create!(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

      grey = sloan.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
      karev = sloan.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
      bailey = sloan.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
      shepherd = seaside.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")

      expect(sloan.doctor_count).to eq(3)
    end
  end

  describe "#affiliated_universities" do
    it "lists the universities the hospital's doctors attended" do
      sloan = Hospital.create!(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      seaside = Hospital.create!(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

      grey = sloan.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
      karev = sloan.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
      bailey = sloan.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
      shepherd = seaside.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")

      expect(sloan.affiliated_universities).to eq("Harvard University, Johns Hopkins University, Stanford University")
    end
  end

  describe "#all_patients" do
    it "lists the names of all that hospital's patients from oldest to youngest" do
      sloan = Hospital.create!(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      seaside = Hospital.create!(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

      grey = sloan.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
      karev = sloan.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
      bailey = sloan.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
      shepherd = seaside.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")

      bryce = Patient.create!(name: "Katie Bryce", age: 24)
      duquette = Patient.create!(name: "Denny Duquette", age: 39)
      pope = Patient.create!(name: "Rebecca Pope", age: 32)
      zola = Patient.create!(name: "Zola Shepherd", age: 2)

      DoctorPatient.create!(doctor: grey, patient: bryce)
      DoctorPatient.create!(doctor: grey, patient: duquette)
      DoctorPatient.create!(doctor: karev, patient: duquette)
      DoctorPatient.create!(doctor: bailey, patient: pope)
      DoctorPatient.create!(doctor: shepherd, patient: zola)

      expect(sloan.all_patients).to eq([duquette, pope, bryce])
    end
  end
end

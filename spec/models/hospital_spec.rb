require "rails_helper"

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

  describe "instance_methods" do
    it "doctor_count" do
      hospital_2 = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: 98101})
      meredith = Doctor.create({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: "#{hospital_2.id}"})
      alex = Doctor.create({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: "#{hospital_2.id}"})
      expect(hospital_2.doctor_count).to eql(2)
      miranda = Doctor.create({name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: "#{hospital_2.id}"})
      expect(hospital_2.doctor_count).to eql(3)
    end
    it "education_list" do
      hospital_1 = Hospital.create({name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: 90001})
      hospital_2 = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: 98101})
      meredith = Doctor.create({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: "#{hospital_2.id}"})
      alex = Doctor.create({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: "#{hospital_2.id}"})
      miranda = Doctor.create({name: "Miranda Bailey", specialty: "General Surgery", education: "Johns Hopkins University", hospital_id: "#{hospital_2.id}"})
      derek = Doctor.create({name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: "#{hospital_1.id}"})
      expect(hospital_2.education_list).to eql(["Harvard University", "Johns Hopkins University"])
    end


    it "show_patients" do
      hospital_1 = Hospital.create({name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: 90001})
      hospital_2 = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: 98101})
      meredith = Doctor.create({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: "#{hospital_2.id}"})
      alex = Doctor.create({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: "#{hospital_2.id}"})
      miranda = Doctor.create({name: "Miranda Bailey", specialty: "General Surgery", education: "Johns Hopkins University", hospital_id: "#{hospital_1.id}"})
      katie = Patient.create({name: "Katie Bryce", age: 24})
      denny = Patient.create({name: "Denny Duquette", age: 39})
      rebecca = Patient.create({name: "Rebecca Pope", age: 32})
      zola = Patient.create({name: "Zola  Shepherd", age: 2})
      meredith.patients << rebecca
      meredith.patients << katie
      miranda.patients << denny
      alex.patients << zola
      expect(hospital_2.show_patients).to eql(["#{rebecca.name}", "#{katie.name}", "#{zola.name}"])
    end


    end
  end

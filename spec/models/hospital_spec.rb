require 'rails_helper'

RSpec.describe Hospital do
  describe "relationships" do
    it {should have_many :doctors}
  end

  describe "instance methods" do
    it ".total_number_of_doctors" do
      memorial = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      seaside = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

      grey = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: memorial.id)
      bailey = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: memorial.id)
      karev = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: memorial.id)
      yang = Doctor.create(name: "Cristina Yang", specialty: "Cardiothoracic Surgery", education: "Stanford University", hospital_id: memorial.id)
      shepherd = Doctor.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: memorial.id)
      sloan = Doctor.create(name: "Mark McSteamy Sloan", specialty: "Plastic Surgeron", education: "University of Pennsylvania", hospital_id: memorial.id)
      avery = Doctor.create(name: "Jackson Avery", specialty: "Plastic Surgery", education: "Boston University", hospital_id: seaside.id)

      expect(memorial.total_number_of_doctors).to eq(6)
      expect(memorial.total_number_of_doctors).to_not eq(7)
      expect(seaside.total_number_of_doctors).to eq(1)
    end

    it ".unique_education" do
      memorial = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      grey = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: memorial.id)
      bailey = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: memorial.id)
      karev = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: memorial.id)
      yang = Doctor.create(name: "Cristina Yang", specialty: "Cardiothoracic Surgery", education: "Stanford University", hospital_id: memorial.id)
      shepherd = Doctor.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: memorial.id)
      sloan = Doctor.create(name: "Mark McSteamy Sloan", specialty: "Plastic Surgeron", education: "University of Pennsylvania", hospital_id: memorial.id)

      expect(memorial.unique_education).to eq(["Harvard University", "Johns Hopkins University", "Stanford University", "University of Pennsylvania"])
    end

    it "order_by_age" do
      memorial = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")

      grey = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: memorial.id)
      karev = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: memorial.id)
      bailey = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: memorial.id)

      bryce = Patient.create(name: "Katie Bryce", age: 24)
      duqette = Patient.create(name: "Denny Duquette", age: 39)
      zola = Patient.create(name: "Zola Shepherd", age: 2)
      pope = Patient.create(name: "Rebecca Pope", age: 32)

      DoctorPatient.create(doctor_id: karev.id, patient_id: pope.id)
      DoctorPatient.create(doctor_id: karev.id, patient_id: zola.id)
      DoctorPatient.create(doctor_id: bailey.id, patient_id: duqette.id)
      DoctorPatient.create(doctor_id: grey.id, patient_id: bryce.id)

      expect(memorial.order_by_patients_age).to eq(["Denny Duquette", "Rebecca Pope", "Katie Bryce", "Zola Shepherd"])
    end
  end
end

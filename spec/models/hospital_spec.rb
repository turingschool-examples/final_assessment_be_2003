require 'rails_helper'

RSpec.describe Hospital do
  describe 'Relationships' do
    it {should have_many :doctors}
    it {should have_many(:doctor_patients).through(:doctors)}
  end

  describe 'Validations' do
    it {should validate_presence_of :name }
    it {should validate_presence_of :address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip}
  end

  describe 'instance methods' do
    before(:each) do
      @hospital = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      @psych = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")
      @grey = @hospital.doctors.create(name: "Meredith Grey", speciality: "General Surgery", education: "Harvard University")
      @karev = @hospital.doctors.create(name: "Alex Karev", speciality: "Pediatric Surgery", education: "Johns Hopkins University")
      @martian = @hospital.doctors.create(name: "Marvin the Martian", speciality: "Outer Space", education: "Johns Hopkins University")
      @bunny = @psych.doctors.create(name: "Bugs Bunny", speciality: "Carrot Surgery", education: "Looney Tunes University")
      @katie = Patient.create(name: "Katie Bryce", age: 24)
      @denny = Patient.create(name: "Denny Duquette", age: 39)
      @rebecca = Patient.create(name: "Rebecca Pope", age: 32)
      @tweety = Patient.create(name: "Tweety Bird", age: 5)
      DoctorPatient.create(doctor_id: @grey.id, patient_id: @katie.id)
      DoctorPatient.create(doctor_id: @karev.id, patient_id: @katie.id)
      DoctorPatient.create(doctor_id: @grey.id, patient_id: @denny.id)
      DoctorPatient.create(doctor_id: @grey.id, patient_id: @rebecca.id)
      DoctorPatient.create(doctor_id: @bunny.id, patient_id: @tweety.id)
    end

    it '#doctor_universities' do
      expect(@hospital.doctor_universities).to eq("#{@grey.education} and #{@karev.education}")
    end

    it '#doctor_count' do
      expect(@hospital.doctor_count).to eq(3)
    end

    it '#patients' do
      expect(@hospital.patients).to eq(["#{@denny.name}", "#{@rebecca.name}", "#{@katie.name}"])
    end
  end
end

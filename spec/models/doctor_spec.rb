require 'rails_helper'

RSpec.describe Doctor do

  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :specialty}
    it {should validate_presence_of :education}
  end

  describe 'Relationships' do
    it {should belong_to :hospital}
    it {should have_many :doctor_patients}
    it {should have_many(:patients).through(:doctor_patients)}
  end

  describe 'Methods' do
    it ".all_universities" do
      grey = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      grey.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
      grey.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
      grey.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Harvard University")
      expect(grey.doctors.all_universities.first.education).to eq("Harvard University")
      expect(grey.doctors.all_universities.last.education).to eq("Johns Hopkins University")
    end

    it ".find_doctor_patient_id" do
      grey = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      meridith = grey.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
      denny = Patient.create(name: "Denny Duquette", age: 39)
      doctor_patient = DoctorPatient.create(doctor_id: meridith.id, patient_id: denny.id)
      expect(meridith.find_doctor_patient_id(denny.id)).to eq(doctor_patient.id)
    end

  end

end

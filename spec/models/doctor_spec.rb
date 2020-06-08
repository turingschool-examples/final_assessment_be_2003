require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'relationships' do
    it {should belong_to :hospital}
    it {should have_many :doctor_patients}
    it {should have_many(:patients).through(:doctor_patients)}
  end

  describe 'class methods' do
    it ".all_patients" do
      @sloan = Hospital.create(name: "Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city: "Seattle", state: "WA", zipcode: "98101")
      @seaside = Hospital.create(name:"Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zipcode: "90001")

      @meredith = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: @sloan.id)
      @derek = Doctor.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: @sloan.id)
      @bob = Doctor.create(name: "Bob", specialty: "General Surgery", education: "Harvard University", hospital_id: @sloan.id)
      @miranda = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: @seaside.id)

      @katie = Patient.create(name: "Katie Bryce", age: 24)
      @rebecca = Patient.create(name: "Rebecca Pope", age: 32)
      @denny = Patient.create(name: "Denny Duquette", age: 39)
      @hannah = Patient.create(name: "hannah", age: 20)

      DoctorPatient.create(doctor_id: @meredith.id, patient_id: @katie.id)
      DoctorPatient.create(doctor_id: @meredith.id, patient_id: @rebecca.id)
      DoctorPatient.create(doctor_id: @bob.id, patient_id: @denny.id)
      DoctorPatient.create(doctor_id: @miranda.id, patient_id: @hannah.id)

      doctors = Doctor.where(hospital_id: @sloan)
      expect(doctors.all_patients).to eq([@katie, @rebecca, @denny])
    end
  end
end

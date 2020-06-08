require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "relationships" do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe "model methods"do
    before :each do
      @hospital1 = Hospital.create(name:"Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101" )

      @doctor1 = @hospital1.doctors.create(name: "Meredith Grey1", specialty: "General Surgery", education: "Harvard University")
      @doctor2 = @hospital1.doctors.create(name: "N2", specialty: "S1", education: "Boston University")
    
      @patient1 = Patient.create(name: "Katie Bryce", age: 24)

      @doctor_patient1 = DoctorPatient.create(doctor_id: @doctor1.id, patient_id: @patient1.id)
      @doctor_patient2 = DoctorPatient.create(doctor_id: @doctor2.id, patient_id: @patient1.id)
    end
    it ".this_doctor_patient()" do
      expect(@patient1.this_doctor_patient(@doctor2.id)).to eq(@doctor_patient2)
    end
    
    
  end
  
  
end
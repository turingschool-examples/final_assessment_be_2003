require 'rails_helper'

RSpec.describe Patient, type: :model do 
  describe "relationships" do
    it { should have_many(:doctor_patients) } 
    it { should have_many(:doctors).through(:doctor_patients) } 
  end

  describe "methods" do
    before(:each) do
      @hospital1 = Hospital.create(name: "Banner Desert", address: "123 Medical Dr", city: "Mesa", state: "AZ", zip: "80202")
      @doc1 = @hospital1.doctors.create(name: "John Matrix", specialty: "Cardiology", education: "Arizona State University")
      @doc2 = @hospital1.doctors.create(name: "Doug Quiad", specialty: "Neurology", education: "Metro State University")
      @pat1 = Patient.create(name: "Little Timmy", age: 10)
      @pat2 = Patient.create(name: "Ice T", age: 60)
      @pat3 = Patient.create(name: "Tron", age: 30)
      @pat4 = Patient.create(name: "John Wick", age: 40)
      
      DoctorPatient.create(doctor_id: @doc1.id, patient_id: @pat1.id)
      DoctorPatient.create(doctor_id: @doc1.id, patient_id: @pat2.id)
      DoctorPatient.create(doctor_id: @doc2.id, patient_id: @pat3.id)
    end
    
  end
  
end
require 'rails_helper'

RSpec.describe Doctor, type: :model do 
  describe "relationships" do
    it { should belong_to(:hospital) } 
    it { should have_many(:doctor_patients) }
    it { should have_many(:patients).through(:doctor_patients) }  
  end

  describe "methods" do
    it "#sorted age" do
      hospital1 = Hospital.create(name: "Banner Desert", address: "123 Medical Dr", city: "Mesa", state: "AZ", zip: "80202")
      doc1 = hospital1.doctors.create(name: "John Matrix", specialty: "Cardiology", education: "Arizona State University")
      pat1 = Patient.create(name: "Little Timmy", age: 10)
      pat2 = Patient.create(name: "Ice T", age: 60)    
      DoctorPatient.create(doctor_id: doc1.id, patient_id: pat1.id)
      DoctorPatient.create(doctor_id: doc1.id, patient_id: pat2.id)
      
      expect(doc1.sorted_age).to eq([pat2, pat1]) 
    end
  end
end
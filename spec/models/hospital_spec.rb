require 'rails_helper'

RSpec.describe Hospital, type: :model do 
  describe "relationships" do
    it { should have_many :doctors}
  end

  describe "methods" do
    before(:each) do
      @hospital1 = Hospital.create(name: "Banner Desert", address: "123 Medical Dr", city: "Mesa", state: "AZ", zip: "80202")
      @doc1 = @hospital1.doctors.create(name: "John Matrix", specialty: "Cardiology", education: "Arizona State University")
      @doc2 = @hospital1.doctors.create(name: "Doug Quiad", specialty: "Neurology", education: "Metro State University")
      @doc3 = @hospital1.doctors.create(name: "Harry Tasker", specialty: "Pulmonology", education: "Arizona State University")
      @pat1 = Patient.create(name: "Little Timmy", age: 10)
      @pat2 = Patient.create(name: "Ice T", age: 60)
      @pat3 = Patient.create(name: "Tron", age: 30)
      @pat4 = Patient.create(name: "John Wick", age: 40)
      
      DoctorPatient.create(doctor_id: @doc1.id, patient_id: @pat1.id)
      DoctorPatient.create(doctor_id: @doc1.id, patient_id: @pat2.id)
      DoctorPatient.create(doctor_id: @doc1.id, patient_id: @pat3.id)
      DoctorPatient.create(doctor_id: @doc2.id, patient_id: @pat4.id)
    end

    it "#doc_count" do
      expect(@hospital1.doc_count).to eq(3) 
    end

    it "#doc_universities" do
      expect(@hospital1.doc_universities).to eq(["Arizona State University", "Metro State University"]) 
    end

    # it "#hospital_patients" do
    #   expect(@hospital1.hospital_patients).to eq([@pat1, @pat2, @pat3, @pat4])
    # end
    
  end
end
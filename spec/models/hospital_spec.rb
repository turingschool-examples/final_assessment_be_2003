require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it {should have_many :doctors}
  end
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zip }
  end

  describe "methods" do
    before :each do
      @hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101" )
      @hospital_2 = Hospital.create!(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")
      @doc_1 = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: @hospital_1.id)
      @doc_2 = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: @hospital_1.id)
      @doc_3 = Doctor.create!(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: @hospital_2.id)
      @doc_4 = Doctor.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: @hospital_2.id)
      @doc_5 = Doctor.create!(name: "Doctor Phill", specialty: "Attending Surgeon", education: "Harvard University", hospital_id: @hospital_1.id)
      @patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
      @patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
      @patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
      @patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)

      PatientDoctor.create!(doctor_id: @doc_1.id, patient_id: @patient_1.id)
      PatientDoctor.create!(doctor_id: @doc_1.id, patient_id: @patient_2.id)
      PatientDoctor.create!(doctor_id: @doc_1.id, patient_id: @patient_3.id)
      PatientDoctor.create!(doctor_id: @doc_2.id, patient_id: @patient_1.id)
      PatientDoctor.create!(doctor_id: @doc_2.id, patient_id: @patient_3.id)
    end

      it "number_of_doctors" do
        expect(@hospital_1.number_of_doctors).to eq(3)
      end

      it "universities" do
        expect(@hospital_1.universities).to eq(["Harvard University", "Johns Hopkins University"])
      end

      it "patient_list" do
        expect([@hospital_1.patient_list.first.name]).to eq(["#{@patient_2.name}"])
        expect([@hospital_1.patient_list.last.name]).to eq(["#{@patient_1.name}"])
      end

  end


end

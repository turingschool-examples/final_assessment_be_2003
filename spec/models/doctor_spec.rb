require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :specialty}
    it { should validate_presence_of :education}
  end

  describe "relationships" do
    it { should belong_to :hospital}
    it { should have_many :doctor_patients}
    it {should have_many(:patients).through(:doctor_patients)}
  end

  describe "methods" do
    it ".uniqe_schools" do
      grey = Hospital.create(name:"Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")

      meredith = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: grey.id)
      alex = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Stanford University", hospital_id: grey.id)
      mirando = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: grey.id)
      mcdreamy = Doctor.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: grey.id)
      
      docs = Doctor.all
      expect(docs.unique_schools).to eq(["Harvard University", "Stanford University", "University of Pennsylvania"])
    end
  end
end
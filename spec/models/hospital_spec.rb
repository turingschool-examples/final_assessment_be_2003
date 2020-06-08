require 'rails_helper'

describe Hospital, type: :model do
  describe "relationships" do
    it {should have_many :doctors}
    it {should have_many(:doctor_patients).through(:doctors)}
    it {should have_many(:patients).through(:doctor_patients)}
  end
  describe "instance methods" do
    before :each do
      @grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital",
                                   address: "123 Save Lives Rd",
                                   city: "Seattle",
                                   state: "WA",
                                   zip: "98101")

      @meredith = Doctor.create(name: "Meredith Grey",
                                specialty: "General Surgery",
                                education: "Harvard University",
                                hospital_id: @grey_sloan.id)

      @alex = Doctor.create(name: "Alex Karev",
                            specialty: "Pediatric Surgery",
                            education: "Johns Hopkins University",
                            hospital_id: @grey_sloan.id)
    end

    it '#num_doctors' do
      expect(@grey_sloan.num_doctors).to eq(2)

      Doctor.create(name: "Derek Shepherd",
                    specialty: "Attending Surgeon",
                    education: "University of Pennsylvania",
                    hospital_id: @grey_sloan.id)

      expect(@grey_sloan.num_doctors).to eq(3)
    end

    it '#unique_univ' do
      expect(@grey_sloan.unique_univ).to eq("Harvard University, Johns Hopkins University")

      Doctor.create(name: "Derek Shepherd",
                    specialty: "Attending Surgeon",
                    education: "Harvard University",
                    hospital_id: @grey_sloan.id)

      expect(@grey_sloan.unique_univ).to eq("Harvard University, Johns Hopkins University")
    end
  end
end

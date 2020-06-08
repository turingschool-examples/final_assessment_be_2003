require "rails_helper"

RSpec.describe Hospital, type: :model do
  describe "relationships" do
    it {should have_many :doctors}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip}
  end

  describe "instance methods" do
    before(:each) do
      @hospital1 = Hospital.create(name: "Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city:"Seattle", state:"WA", zip: "98101")
      @doctor1 = @hospital1.doctors.create(name:"Merideth Grey", specialty: "General Surger", education: "harvard University")
      @doctor2 = @hospital1.doctors.create(name:"Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
      @doctor3 = @hospital1.doctors.create(name:"Doctor", specialty: "surgeon", education:"harvard University")
    end

    it "calculates the number of doctors for the hospital" do
      expect(@hospital1.number_of_doctors).to eq(3)
    end

    it "return the unique list of schools associated with the hospital" do
      expect(@hospital1.unique_schools).to eq()
    end

  end



end

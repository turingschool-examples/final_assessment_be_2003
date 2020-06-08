require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe "relationships" do
    it {should have_many :doctors}
  end
  describe "model methods" do
    before :each do
      @hospital1 = Hospital.create(name:"Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101" )
      @hospital2 = Hospital.create(name:"Seaside Health & Wellness Center", address:"123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001" )

      @doctor1 = @hospital1.doctors.create(name: "Meredith Grey1", specialty: "General Surgery", education: "Harvard University")
      @doctor2 = @hospital1.doctors.create(name: "Meredith Grey2", specialty: "General Surgery", education: "Boston University")
      @doctor3 = @hospital1.doctors.create(name: "Meredith Grey3", specialty: "General Surgery", education: "Harvard University")
      @doctor4 = @hospital1.doctors.create(name: "Meredith Grey4", specialty: "General Surgery", education: "Turing")
      @doctor5 = @hospital2.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
    end
    it ".doctor_count" do
      expect(@hospital1.doctor_count).to eq(4)
    end
    it ".uniq_university" do
      expected = ["Boston University", "Harvard University", "Turing"]
      expect(@hospital1.uniq_universities).to eq(expected)
    end
    
  end
  
  
end
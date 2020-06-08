require 'rails_helper'

describe Hospital, type: :model do
  describe "relationships" do
    it {should have_many :doctors}
  end
  describe "instance methods" do
    it '#num_doctors' do
      grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital",
                                   address: "123 Save Lives Rd",
                                   city: "Seattle",
                                   state: "WA",
                                   zip: "98101")

      Doctor.create(name: "Meredith Grey",
                    specialty: "General Surgery",
                    education: "Harvard University",
                    hospital_id: grey_sloan.id)

      Doctor.create(name: "Alex Karev",
                    specialty: "Pediatric Surgery",
                    education: "Johns Hopkins University",
                    hospital_id: grey_sloan.id)

      expect(grey_sloan.num_doctors).to eq(2)
    end
  end
end

require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe "relationships" do
    it {should have_many :doctors}
  end

  describe "instance methods " do
    it "#number_of_doctors" do

      @greys = Hospital.create!(name: "Grey Sloan Memorial Hospital",
        address: "123 Save Lives Rd",
        city: "Seattle",
        state: "WA",
        zip: 98101)


      @meredith = @greys.doctors.create!(name: "Meredith Grey",
        specialty: "General Surgery",
        education: "Harvard University")

      @alex = @greys.doctors.create!(name: "Alex Karev",
        specialty: "Pediatric Surgery",
        education: "Johns Hopkins University")

      @miranda = @greys.doctors.create!(name: "Miranda Bailey",
        specialty: "General Surgery",
        education: "Stanford University")

      expect(@greys.number_of_doctors).to eq(3)
    end
  end
end

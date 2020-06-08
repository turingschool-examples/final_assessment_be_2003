require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe "relationships" do
    it {should have_many :doctors}
  end

  describe "instance methods " do
    before :each do
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

      @katie = @meredith.patients.create!(name: "Katie Bryce",
        age: 24)
      @denny = @alex.patients.create!(name: "Denny Duquette",
        age: 39)
      @rebecca = @miranda.patients.create!(name: "Rebecca Pope",
        age: 32)
    end

    it "#number_of_doctors" do
      expect(@greys.number_of_doctors).to eq(3)
    end

    it "#doctor_universities" do
      expect(@greys.doctor_universities).to eq(["Harvard University","Johns Hopkins University", "Stanford University"])
    end

    it "#patients_by_age" do
      expect(@greys.patients_by_age.first).to eq(@denny)
      expect(@greys.patients_by_age.last).to eq(@katie)
      expect(@greys.patients_by_age).to eq([@denny,@rebecca,@katie])
    end
  end
end

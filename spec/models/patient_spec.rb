require "rails_helper"

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many :patient_doctors }
    it { should have_many(:doctors).through(:patient_doctors) }
  end

  describe "class method" do
    it "sort_by_age" do
      patients = Patient.all
      general = Hospital.create!(name: "Grey Sloan Memorial Hospital",
                               address: "123 Save Lives Rd",
                               city: "Seattle",
                               state: "WA",
                               zip: "98101")
      meredith = general.doctors.create!(name: "Meredith Grey",
                                      specialty: "General Surgery",
                                      education: "Harvard University")
      katie = meredith.patients.create!(name: "Katie Bryce",
                              age: "24")

      denny = meredith.patients.create!(name: "Denny Duquette",
                              age: "39")

      expect(patients.sort_by_age.first).to eq(katie)
      expect(patients.sort_by_age.last).to eq(denny)
    end
  end
end

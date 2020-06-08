require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'relationships' do
    it { should have_many :doctors }
  end

  describe "instance method" do
    it "list_schools" do
      general = Hospital.create!(name: "Grey Sloan Memorial Hospital",
                               address: "123 Save Lives Rd",
                               city: "Seattle",
                               state: "WA",
                               zip: "98101")
      meredith = general.doctors.create!(name: "Meredith Grey",
                                      specialty: "General Surgery",
                                      education: "Harvard University")
      mcdreamy = general.doctors.create!(name: "Derek McDreamy Shepherd",
                                      specialty: "Attending Surgeon",
                                      education: "University of Pennsylvania")


      expect(general.list_schools).to eq(["Harvard University", "University of Pennsylvania"])
      end
    end
  end

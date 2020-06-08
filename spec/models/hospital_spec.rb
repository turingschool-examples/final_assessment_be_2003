require 'rails_helper'

RSpec.describe Hospital do

  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip}
  end

  describe 'Relationships' do
    it {should have_many :doctors}
  end

  describe 'Methods' do
    it ".count_of_doctors" do
      grey = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      grey.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
      grey.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
      grey.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Harvard University")
      expect(grey.count_of_doctors).to eq(3)
    end
  end

end

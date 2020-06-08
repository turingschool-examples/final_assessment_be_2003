require 'rails_helper'

RSpec.describe Doctor do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :specialty}
    it {should validate_presence_of :education}
  end
  describe "relationships" do 
    it {should have_many :doctor_patients}
    it {should have_many(:patients).through(:doctor_patients)}
  end
end
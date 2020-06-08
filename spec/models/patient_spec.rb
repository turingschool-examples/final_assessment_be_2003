require 'rails_helper'

describe Patient, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe "relationships" do
    it {should have_many :patient_doctors}
    it {should have_many(:doctors).through(:patient_doctors)}
  end
end
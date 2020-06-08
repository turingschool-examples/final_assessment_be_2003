require 'rails_helper'

describe Doctor, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :specialty}
    it {should validate_presence_of :education}
  end

  describe "relationships" do
    it {should belong_to :hospital}
    it {should have_many :patient_doctors}
    it {should have_many(:patients).through(:patient_doctors)}
  end
end
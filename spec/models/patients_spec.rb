require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "relationships" do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end
  
  
end
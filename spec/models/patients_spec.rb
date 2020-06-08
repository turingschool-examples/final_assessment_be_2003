require 'rails_helper'

RSpec.describe Patient do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end
  describe "relationships" do
    it {should have_many :doctor_patients}
    it { should have_many(:doctors).through(:doctor_patients)}
  end
  describe 'methods' do
    it '#order_by_age' do
      @jen = Patient.create(name: "Jen Ducket", age: 19)
      @erik = Patient.create(name: "Erik Palladino", age: 22)
      @ethan = Patient.create(name: "Ethan Embry", age: 21)
      @lauren = Patient.create(name: "Lauren Ambrose", age: 18)
      @patient = Patient.all
      expect(@patient.order_by_age).to eq([@lauren, @jen, @ethan, @erik])
    end
  end
end

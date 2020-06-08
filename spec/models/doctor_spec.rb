require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
  end
  describe "relationships" do
    it { should belong_to :hospital}
    it { should have_many :doctor_patients}
    it {should have_many(:patients).through(:doctor_patients)}
  end
end
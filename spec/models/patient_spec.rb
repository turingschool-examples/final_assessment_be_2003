require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :age }
  end

  describe "relationships" do
    it {should belong_to :doctors}
    it {should have_many :doctors}
  end  
end

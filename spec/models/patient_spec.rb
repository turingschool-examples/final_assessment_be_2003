require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it {should have_many(:doctors).through(:patient_doctors)}

  end
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end


end

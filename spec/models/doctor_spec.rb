require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it {should belong_to :hospital}
    it {should have_many(:patients).through(:patient_doctors)}
  end
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :specialty }
    it { should validate_presence_of :education }
    it { should validate_presence_of :hospital_id }
  end
end

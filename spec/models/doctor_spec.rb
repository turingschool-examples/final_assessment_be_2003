require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :specialty }
    it { should validate_presence_of :education }
  end

  describe "relationships" do
    it {should belong_to :hospitals}
    it {should have_many :patients}
  end
end

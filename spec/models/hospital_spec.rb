require 'rails_helper'

RSpec.describe Hospital, type: :model do 
  describe "Validations" do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip) }
  end

  describe "relatioships" do
    it { should have_many(:doctors) }
  end
end 
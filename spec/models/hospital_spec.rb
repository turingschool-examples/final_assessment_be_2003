require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'relationships' do
    it { should have_many :doctors }
  end

  describe 'instance methods' do
    it "full_address" do 
      hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")

      expect(hospital1.full_address).to eq("#{hospital1.address} #{hospital1.city}, #{hospital1.state} #{hospital1.zip}")
    end 
  end
end
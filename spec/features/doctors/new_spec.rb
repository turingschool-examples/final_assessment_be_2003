require 'rails_helper'

RSpec.describe 'Create New Doctor' do
  describe 'As a visitor' do
    before :each do
      @hospital = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    end

    it "I can get to a new doctor form from hospital show page" do
      visit "/hospitals/#{@hospital.id}"

      click_link "Add New Doctor"

      expect(current_path).to eq("/hospitals/#{@hospital.id}/doctors/new")
    end 
  end
end

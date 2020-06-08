require 'rails_helper'

RSpec.describe "new doctor form" do
  context "as a visitor" do
    before(:each) do
      @hospital1 = Hospital.create(name: "Banner Desert", address: "123 Medical Dr", city: "Mesa", state: "AZ", zip: "80202")
      @doc1 = @hospital1.doctors.create(name: "John Matrix", specialty: "Cardiology", education: "Arizona State University")
    end

    it "can add a new doctor to a hospital" do
      
      visit hospital_path(@hospital1)

      expect(page).to have_content("Number of Doctors: 1") 

      click_link "New Doctor Hire for Banner Desert"

      expect(current_path).to eq(new_hospital_doctor_path(@hospital1))

      fill_in :name,	with: "Bob" 
      fill_in :specialty,	with: "ENT" 
      fill_in :education,	with: "BYU" 

      click_button "Submit"

      expect(current_path).to eq(hospital_path(@hospital1)) 

      expect(page).to have_content("Number of Doctors: 2") 
    end
  end
end


# As a visitor
# When I visit a hospital's show page
# I see a link to add a doctor for this hospital
# When I click that link
# I'm taken to a page that has a title of "New Doctor Hire for <insert hospital name here>"
# And on that page there's a form for me to enter a new doctor's name, specialty, and university where they got their doctorate.
# When I fill out all three fields and click submit
# I am taken back to the hospital show page 
# And I can see that the number of doctors has increased by one
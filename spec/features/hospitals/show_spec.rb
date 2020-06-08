require 'rails_helper'

RSpec.describe "hospital show page" do
  context "as a visitor" do
    before(:each) do
      @hospital1 = Hospital.create(name: "Banner Desert", address: "123 Medical Dr", city: "Mesa", state: "AZ", zip: "80202")
      
      @doc1 = @hospital1.doctors.create(name: "John Matrix", specialty: "Cardiology", education: "Arizona State University")
      @doc2 = @hospital1.doctors.create(name: "Doug Quiad", specialty: "Neurology", education: "Metro State University")
      @doc3 = @hospital1.doctors.create(name: "Harry Tasker", specialty: "Pulmonology", education: "Arizona State University")

    end

    it "can see that hospitals info" do
      
      visit hospital_path(@hospital1)

      expect(page).to have_content(@hospital1.name) 
      expect(page).to have_content(@hospital1.address) 
      expect(page).to have_content(@hospital1.city) 
      expect(page).to have_content(@hospital1.state) 
      expect(page).to have_content(@hospital1.zip) 
    end

    it "can see the number of doctors and unique list of their universities" do
      
      visit hospital_path(@hospital1)

      expect(page).to have_content("Number of Doctors: 3") 
      expect(page).to have_content("Metro State University") 
      expect(page).to have_content("Arizona State University", count: 1) 
    end
  end
end


# User Story 2, Hospital Show Page
# "As a visitor
# When I visit a hospital's show page
# I see the hospital's name,street address, city, state, and zip
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended
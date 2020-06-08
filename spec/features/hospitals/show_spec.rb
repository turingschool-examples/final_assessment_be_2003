require 'rails_helper'

RSpec.describe "Hospital Show Page" do
  before :each do
    @hospital1 = Hospital.create(name:"Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101" )
    @hospital2 = Hospital.create(name:"Seaside Health & Wellness Center", address:"123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001" )

    @doctor1 = @hospital1.doctors.create(name: "Meredith Grey1", specialty: "General Surgery", education: "Harvard University")
    @doctor2 = @hospital1.doctors.create(name: "Meredith Grey2", specialty: "General Surgery", education: "Boston University")
    @doctor3 = @hospital1.doctors.create(name: "Meredith Grey3", specialty: "General Surgery", education: "Harvard University")
    @doctor4 = @hospital1.doctors.create(name: "Meredith Grey4", specialty: "General Surgery", education: "Turing")
    @doctor5 = @hospital2.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")

  end
  it "US2 Hospital show has info, number of doctors, and uniq list of universities" do
    visit hospital_path(@hospital1)

    within("#hospital-info")do
      expect(page).to have_content("Name: #{@hospital1.name}")
      expect(page).to have_content("Street Address: #{@hospital1.address}")
      expect(page).to have_content("City: #{@hospital1.city}")
      expect(page).to have_content("State: #{@hospital1.state}")
      expect(page).to have_content("Zip: #{@hospital1.zip}")
      expect(page).to_not have_content("Name: #{@hospital2.name}")
      expect(page).to_not have_content("Street Address: #{@hospital2.address}")
      expect(page).to_not have_content("City: #{@hospital2.city}")
      expect(page).to_not have_content("State: #{@hospital2.state}")
      expect(page).to_not have_content("Zip: #{@hospital2.zip}")
    end

    within("#doctor-info")do
      expect(page).to have_content("Number of Doctors: #{@hospital1.doctor_count}")
      expect(page).to have_content("Universities Attended: #{@hospital1.uniq_universities}")
    end


  end
  

end#final
# User Story 2, Hospital Show Page
# "As a visitor
# When I visit a hospital's show page
# I see the hospital's name,street address, city, state, and zip
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended
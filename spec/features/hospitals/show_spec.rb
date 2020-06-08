require 'rails_helper'

RSpec.describe "As a visitor" do
    describe "when I visit a hospital's show page" do
        it "I see the hospitals info, the doctors that work at this hospital and a unique list of univesities these doctors have attended" do

            seaside = Hospital.create!(name: "Seaside Health & Wellness Center",
                           address: "123 Private Practice Road",
                           city: "Los Angeles", 
                           state: "CA", 
                           zip: "90001")
                           
            miranda = seaside.doctors.create!(name: "Miranda Bailey",
                        specialty: "General Surgery",
                        education: "Stanford University")

            derek = seaside.doctors.create!(name: "Derek McDreamy Shepherd",
                                specialty: "Attending Surgeon",
                                education: "University of Pennsylvania")

            meredith = seaside.doctors.create!(name: "Meredith Grey",
                            specialty: "General Surgery", 
                            education: "University of Pennsylvania")

            greys = Hospital.create!(name: "Grey Sloan Memorial Hospital",
                        address: "123 Save Lives Rd",
                        city: "Seattle", 
                        state: "WA",
                        zip: "98101")


            alex = greys.doctors.create!(name: "Alex Karev",
                                specialty: "Pediatric Surgery",
                                education: "Johns Hopkins University")

            visit "/hospitals/#{seaside.id}" 

            expect(page).to have_content(seaside.name)
            expect(page).to have_content(seaside.address)
            expect(page).to have_content(seaside.city)
            expect(page).to have_content(seaside.state)
            expect(page).to have_content(seaside.zip)

            expect(page).to_not have_content(greys.name)
         
            expect(page).to have_content("List of Universities attended by doctors at hospital:")
            expect(page).to have_content("Stanford University")
            expect(page).to have_content("University of Pennsylvania")

            expect(page).to_not have_content("Johns Hopkins University")       
        end
    end
end

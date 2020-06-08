require 'rails_helper'

RSpec.describe "As a visitor" do
    describe "when I visit a hospital's show page" do

        before(:each) do 
            @seaside = Hospital.create!(name: "Seaside Health & Wellness Center",
                           address: "123 Private Practice Road",
                           city: "Los Angeles", 
                           state: "CA", 
                           zip: "90001")
                           
            @miranda = @seaside.doctors.create!(name: "Miranda Bailey",
                        specialty: "General Surgery",
                        education: "Stanford University")

            @derek = @seaside.doctors.create!(name: "Derek McDreamy Shepherd",
                                specialty: "Attending Surgeon",
                                education: "University of Pennsylvania")

            @meredith = @seaside.doctors.create!(name: "Meredith Grey",
                            specialty: "General Surgery", 
                            education: "University of Pennsylvania")

            @greys = Hospital.create!(name: "Grey Sloan Memorial Hospital",
                        address: "123 Save Lives Rd",
                        city: "Seattle", 
                        state: "WA",
                        zip: "98101")


            @alex = @greys.doctors.create!(name: "Alex Karev",
                                specialty: "Pediatric Surgery",
                                education: "Johns Hopkins University")

            @katie = Patient.create!(name: "Katie Bryce",
                        age: 24)

            @denny = Patient.create!(name: "Denny Duquette",
                                    age: 39)

            @rebecca = Patient.create!(name: "Rebecca Pope",
                                    age: 32)

            @zola = Patient.create!(name: "Zola Shepherd",
                                age: 2)

            DoctorPatient.create!(doctor: @miranda, patient: @katie)
            DoctorPatient.create!(doctor: @derek, patient: @denny)
            DoctorPatient.create!(doctor: @meredith, patient: @rebecca)
            DoctorPatient.create!(doctor: @meredith, patient: @zola)
        end 

        it "I see the hospitals info, the doctors that work at this hospital and a unique list of univesities these doctors have attended" do

            visit "/hospitals/#{@seaside.id}" 
        save_and_open_page
            expect(page).to have_content(@seaside.name)
            expect(page).to have_content(@seaside.address)
            expect(page).to have_content(@seaside.city)
            expect(page).to have_content(@seaside.state)
            expect(page).to have_content(@seaside.zip)

            expect(page).to_not have_content(@greys.name)
         
            expect(page).to have_content("List of Universities attended by doctors at hospital:")
            expect(page).to have_content("Stanford University")
            expect(page).to have_content("University of Pennsylvania")

            expect(page).to_not have_content("Johns Hopkins University")       
        end

        it "I see a link to view all patients seen at hospital" do

            visit "/hospitals/#{@seaside.id}"

            click_link "Patient List"
            
            expect(current_path).to eq("/hospitals/#{@seaside.id}/patients")

            within "#patient-0" do 
                expect(page).to have_content(@denny.name)
            end

            within "#patient-1" do 
                expect(page).to have_content(@rebecca.name)
            end

            within "#patient-2" do 
                expect(page).to have_content(@katie.name)
            end

            within "#patient-3" do 
                expect(page).to have_content(@zola.name)
            end
        end 
    end
end

require 'rails_helper'

RSpec.describe "As a visitor" do
    describe "when I visit a doctor's show page" do

        before(:each) do
             @greys = Hospital.create!(name: "Grey Sloan Memorial Hospital",
                        address: "123 Save Lives Rd",
                        city: "Seattle", 
                        state: "WA",
                        zip: "98101")

            @meredith = @greys.doctors.create!(name: "Meredith Grey",
                          specialty: "General Surgery", 
                          education: "Harvard University")

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

            DoctorPatient.create(doctor: @meredith, patient: @katie)
            DoctorPatient.create(doctor: @meredith, patient: @denny)
            DoctorPatient.create(doctor: @meredith, patient: @rebecca)
        end

        it "I see all of the doctor's info, the hospital they work for and names of all their patients" do
            
            visit "/doctors/#{@meredith.id}"

            expect(page).to have_content(@meredith.name)
            expect(page).to have_content(@meredith.specialty)
            expect(page).to have_content(@meredith.education)
            expect(page).to have_content("#{@meredith.name} currently works for #{@greys.name}")

            within ".patient-#{@katie.id}" do 
                expect(page).to have_content(@katie.name)
            end

            within ".patient-#{@denny.id}" do
                expect(page).to have_content(@denny.name)
            end

            within ".patient-#{@rebecca.id}" do
                expect(page).to have_content(@rebecca.name)
            end 

            expect(page).to_not have_content(@alex.name)
        end

        it "I see a button next to each patient's name to remove that patient from the doctor's caseload" do 

            visit "/doctors/#{@meredith.id}"

            expect(page).to have_content(@katie.name)
            expect(page).to have_content(@denny.name)
            expect(page).to have_content(@rebecca.name)

            within ".patient-#{@katie.id}" do 
                click_button "Remove Patient from caseload"
            end

            within ".patient-#{@denny.id}" do
                click_button "Remove Patient from caseload"
            end

            expect(page).to_not have_content(@katie.name)
            expect(page).to_not have_content(@denny.name)
            expect(page).to have_content(@rebecca.name)
        end
        
        it "I see a link next to the name of the hospital to reassign doctor to different hospital" do

            seaside = Hospital.create!(name: "Seaside Health & Wellness Center",
                           address: "123 Private Practice Road",
                           city: "Los Angeles", 
                           state: "CA", 
                           zip: "90001")
            
            visit "/doctors/#{@meredith.id}"

            expect(page).to have_content(@greys.name)

            click_link "Assign #{@meredith.name} to a different hospital" 

            expect(current_path).to eq("/doctors/#{@meredith.id}/edit")

            fill_in :hosp_id, with: seaside.id

            click_on "Add #{@meredith.name} to this hospital"

            expect(page).to_not have_content(@greys.name)
            expect(page).to have_content(seaside.name)

        end
    end
end
# User Story 6, Reassign Doctor to Different Hospital
# As a visitor
# When I visit a doctor's show page
# Next to the name of the hospital where this doctor works
# I see a link that says "Assign <insert name of doctor> to a Different Hospital"
# When I click on that link
# I'm taken to a form where I can input an id of an existing hospital
# When I click "Add <insert name of doctor> to this hospital"
# I'm taken back to that doctor's show page
# And I can see the name of the new hospital that they were assigned to
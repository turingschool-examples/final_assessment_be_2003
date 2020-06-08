require 'rails_helper'

RSpec.describe 'New Doctor' do
      xit 'I can create a new doctor' do

        general = Hospital.create!(name: "Grey Sloan Memorial Hospital",
                                   address: "123 Save Lives Rd",
                                   city: "Seattle",
                                   state: "WA",
                                   zip: "98101")

        meredith = general.doctors.create!(name: "Meredith Grey",
                                  specialty: "General Surgery",
                                  education: "Harvard University")

        mcdreamy = general.doctors.create!(name: "Derek McDreamy Shepherd",
                                  specialty: "Attending Surgeon",
                                  education: "University of Pennsylvania")

        visit "/hospitals/#{general.id}"

        expect(page).to have_link("Add Doctor")

        click_link "Add Doctor"

        expect(current_path).to eq('hospitals/#{general.id}/doctors/new')
        expect(page).to have_content('New Doctor Hire for: #{general.name}')

        fill_in 'Name', with: 'Mark Sloan'
        click_on 'Create Doctor'

        expect(current_path).to eq("/hospital/#{general.id}")
        expect(page).to have_content('Mark Sloan')

        expect(page).to have_content("Current number of doctors: 2")


      end
    end

    # I'm taken to a page that has a title of "New Doctor Hire for <insert hospital name here>"
    # And on that page there's a form for me to enter a new doctor's name, specialty, and university where they got their doctorate.
    # When I fill out all three fields and click submit
    # I am taken back to the hospital show page
    # And I can see that the number of doctors has increased by one

require 'rails_helper'
RSpec.describe "As a visitor", type: :feature do
  describe "I see a link on a hospitals show page to view patients" do 
    before(:each) do
      @grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101" )
      @seaside_health = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

      @grey = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: @grey_sloan.id)
      @karev = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: @seaside_health.id)
      @bailey = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: @seaside_health.id)
      @shepherd = Doctor.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: @grey_sloan.id)

      @katie = Patient.create(name: "Katie Bryce", age: 24)
      @denny = Patient.create(name: "Denny Duquette", age: 39)
      @rebecca = Patient.create(name: "Rebecca Pope", age: 32)
      @zola = Patient.create(name: "Zola Shepherd", age: 2)

      PatientDoctor.create(doctor_id: @grey.id, patient_id: @katie.id)
      PatientDoctor.create(doctor_id: @karev.id, patient_id: @denny.id)
      PatientDoctor.create(doctor_id: @karev.id, patient_id: @rebecca.id)
      PatientDoctor.create(doctor_id: @grey.id, patient_id: @zola.id)
      PatientDoctor.create(doctor_id: @karev.id, patient_id: @zola.id)
      PatientDoctor.create(doctor_id: @bailey.id, patient_id: @denny.id)
      PatientDoctor.create(doctor_id: @bailey.id, patient_id: @rebecca.id)
      PatientDoctor.create(doctor_id: @shepherd.id, patient_id: @katie.id)
      PatientDoctor.create(doctor_id: @shepherd.id, patient_id: @zola.id)
    end

    it "I see a list of all the patients from oldest to youngest" do
      visit"/hospitals/#{@seaside_health.id}"

      expect(page).to have_link("View All Patients")
      click_link("View All Patients")
      
      expect(current_path).to eq("/hospitals/#{@seaside_health.id}/patients") 
      expect(page).to have_content(@denny.name) 
      expect(page).to have_content(@rebecca.name) 
      
      
      save_and_open_page
      expect(@rebecca.name).to appear_before(@denny.name)

    end
  end
end 


# As a visitor
# When I visit the hospitals show page 
# I see a link to view all of that hospitals patients 
# When I click that link
# I'm taken to a patients index page for that hospital 
# I see the names of all that hospital's patients listed from oldest to youngest
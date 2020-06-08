require 'rails_helper' 

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit a doctors show page" do 
    before(:each) do
      @grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101" )
      @seaside_health = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

      @grey = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: @grey_sloan.id)
      @karev = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: @seaside_health.id)

      @katie = Patient.create(name: "Katie Bryce", age: 24)
      @denny = Patient.create(name: "Denny Duquette", age: 39)
      @rebecca = Patient.create(name: "Rebecca Pope", age: 32)
      @zola = Patient.create(name: "Zola Shepherd", age: 2)

      PatientDoctor.create(doctor_id: @grey.id, patient_id: @katie.id)
      PatientDoctor.create(doctor_id: @karev.id, patient_id: @denny.id)
      PatientDoctor.create(doctor_id: @karev.id, patient_id: @rebecca.id)
      PatientDoctor.create(doctor_id: @grey.id, patient_id: @zola.id)
      PatientDoctor.create(doctor_id: @karev.id, patient_id: @zola.id)
    end

    it "I see all the doctors information" do 

      visit"/doctors/#{@grey.id}"

      expect(page).to have_content(@grey.name)
      expect(page).to have_content(@grey.specialty)
      expect(page).to have_content(@grey.education)
      expect(page).to have_content(@grey_sloan.name)
      expect(page).to have_content(@katie.name)
      expect(page).to have_content(@zola.name)
      expect(page).to_not have_content(@karev.name)
      expect(page).to_not have_content(@karev.specialty)
    end

    it "Next to each patient's name, I see a button to remove that patient from that doctor's caseload" do 
      visit"/doctors/#{@karev.id}"

      within("#patient-#{@denny.id}") do
        click_link"Remove Patient"
      end

      expect(page).to_not have_content(@denny.name)
      expect(page).to have_content(@rebecca.name)
    end 

    it "I see a link that says 'Assign <insert name of doctor>' to a Different Hospital" do 
      visit"/doctors/#{@grey.id}"

      click_link("Assign #{@grey.name} to a Different Hospital")

      expect(current_path).to eq("/doctors/#{@grey.id}/update")
      expect(page).to have_content("Please Enter an Existing Hospital's ID.") 

      fill_in "Hospital ID",	with: "#{@seaside_health.id}" 

      click_button"Add #{@grey.name} to this hospital"

      expect(current_path).to eq("/doctors/#{@grey}")

      expect(page).to have_content(@seaside_health.name)
    end
  end
end

# As a visitor
# When I visit a doctor's show page
# Next to the name of the hospital where this doctor works
# I see a link that says "Assign <insert name of doctor> to a Different Hospital"
# When I click on that link
# I'm taken to a form where I can input an id of an existing hospital
# When I click "Add <insert name of doctor> to this hospital"
# I'm taken back to that doctor's show page
# And I can see the name of the new hospital that they were assigned to
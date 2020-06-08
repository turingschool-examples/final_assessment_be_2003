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
      save_and_open_page
    end
  end
end

# 'As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
#  - name
#  - specialty
#  - university where they got their doctorate
# And I see the name of the hospital where this doctor works
# And I see the names of all of the patients this doctor has
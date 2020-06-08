require 'rails_helper'

RSpec.describe "doctors show page" do
  context "as a visitor" do
    before(:each) do
      @hospital1 = Hospital.create(name: "Banner Desert", address: "123 Medical Dr", city: "Mesa", state: "AZ", zip: "80202")
      @hospital2 = Hospital.create(name: "Skyline", address: "555 Cactus St", city: "Scottsdale", state: "AZ", zip: "85048")
      
      @doc1 = @hospital1.doctors.create(name: "John Matrix", specialty: "Cardiology", education: "Arizona State University")
      @doc2 = @hospital1.doctors.create(name: "Doug Quiad", specialty: "Neurology", education: "Metro State University")
      
      @pat1 = Patient.create(name: "Little Timmy", age: 10)
      @pat2 = Patient.create(name: "Ice T", age: 60)
      @pat3 = Patient.create(name: "Tron", age: 30)
      @pat4 = Patient.create(name: "John Wick", age: 40)
      
      DoctorPatient.create(doctor_id: @doc1.id, patient_id: @pat1.id)
      DoctorPatient.create(doctor_id: @doc1.id, patient_id: @pat2.id)
      DoctorPatient.create(doctor_id: @doc1.id, patient_id: @pat3.id)
    end

    it "can see all doctors info" do
      
      visit doctor_path(@doc1)

      expect(page).to have_content(@doc1.name) 
      expect(page).to have_content(@doc1.specialty) 
      expect(page).to have_content(@doc1.education) 
      expect(page).to have_no_content(@doc2.name) 
    end

    it "can see their hospital and all their patients" do

      visit doctor_path(@doc1)
# binding.pry
      expect(page).to have_content("Practices at #{@hospital1.name}")   
      expect(page).to have_content(@pat1.name)     
      expect(page).to have_content(@pat2.name)     
      expect(page).to have_content(@pat3.name)     
      expect(page).to have_no_content(@pat4.name)     
    end

    it "can click button to remove patient" do
      
      visit doctor_path(@doc1)

      within ".patients-#{@pat1.id}" do
        click_button "Remove Patient"
      end

      expect(current_path).to eq(doctor_path(@doc1))

      expect(page).to have_no_content(@pat1.name) 
    end

    it "can reassign doctor to another hospital" do
      
      visit doctor_path(@doc1)

      click_link "Assign John Matrix to a Different Hospital"

      expect(current_path).to eq("/doctors/#{@doc1.id}/edit") 

      fill_in :hospital_id,	with: "#{@hospital2.id}" 
      click_button "Submit"

      expect(current_path).to eq(doctor_path(@doc1)) 
      @doc1.reload
      expect(@doc1.hospital).to eq(@hospital2)
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

# As a visitor
# When I visit a Doctor's show page
# Next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed
# ```

# User Story 1, Doctors Show Page
# 'As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
#  - name
#  - specialty
#  - university where they got their doctorate
# And I see the name of the hospital where this doctor works
# And I see the names of all of the patients this doctor has
# ```
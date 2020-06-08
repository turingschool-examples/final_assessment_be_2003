require 'rails_helper'

RSpec.describe "hospital patient index page" do
  context "as a visitor" do
    before(:each) do
      @hospital1 = Hospital.create(name: "Banner Desert", address: "123 Medical Dr", city: "Mesa", state: "AZ", zip: "80202")
      @doc1 = @hospital1.doctors.create(name: "John Matrix", specialty: "Cardiology", education: "Arizona State University")
      @doc2 = @hospital1.doctors.create(name: "Doug Quiad", specialty: "Neurology", education: "Metro State University")

      @pat1 = Patient.create(name: "Little Timmy", age: 10)
      @pat2 = Patient.create(name: "Ice T", age: 60)
      @pat3 = Patient.create(name: "Tron", age: 30)
      @pat4 = Patient.create(name: "John Wick", age: 40)
      
      DoctorPatient.create(doctor_id: @doc1.id, patient_id: @pat1.id)
      DoctorPatient.create(doctor_id: @doc1.id, patient_id: @pat2.id)
      DoctorPatient.create(doctor_id: @doc1.id, patient_id: @pat3.id)
      DoctorPatient.create(doctor_id: @doc2.id, patient_id: @pat4.id)
    end

    it "can see names of patient listed from oldest to youngest" do
      
      visit hospital_path(@hospital1)
      
      click_link "View All Patients"

      expect(current_path).to eq("/hospitals/#{@hospital1.id}/patients") 

      expect(page).to have_content(@pat2.name) 
      expect(page).to have_content(@pat4.name) 
      expect(page).to have_content(@pat3.name) 
      expect(page).to have_content(@pat1.name) 
    end
  end
end


# As a visitor
# When I visit the hospitals show page 
# I see a link to view all of that hospitals patients 
# When I click that link
# I'm taken to a patients index page for that hospital 
# I see the names of all that hospital's patients listed from oldest to youngest
# ```
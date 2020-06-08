require 'rails_helper'

RSpec.describe "Hospital Index Page" do
  describe "from a hospital's show page" do
    it "can click link to view hospital patients" do
      grey = Hospital.create(name:"Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      
      visit "/hospitals/#{grey.id}"
      expect(page).to have_link("View #{grey.name}'s Patients")
      click_link "View #{grey.name}'s Patients"

      expect(current_path).to eq("/hospitals/#{grey.id}/patients")
    end
  end

  it "can see the names of all that hospital's patients listed from oldest to youngest" do
      grey = Hospital.create(name:"Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
     
      meredith = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: grey.id)
      alex = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Stanford University", hospital_id: grey.id)
 
      denny = Patient.create(name: "Denny Duquette", age: 39)
      rebecca = Patient.create(name: "Rebecca Pope", age: 32)
      katie = Patient.create(name: "Katie Bryce", age: 24)
      zola = Patient.create(name: "Zola Shepherd", age: 2)
     
      DoctorPatient.create(doctor: meredith, patient: zola)
      DoctorPatient.create(doctor: meredith, patient: denny)
      DoctorPatient.create(doctor: alex, patient: rebecca)
      DoctorPatient.create(doctor: alex, patient: katie)
      visit "/hospitals/#{grey.id}/patients"

      expect(denny.name).to appear_before(rebecca.name)
      # expect(rebecca.name).to appear_before(katie.name)
      # expect(katie.name).to appear_before(zola.name)
  end
end

#   <%= @hospital.order_by_oldest %>
# # <% @hospital.doctors.each do |doctor| %>
#   <%= doctor.patients.order_by_oldest %>
#   <% end %> 

# User Story 3, Hospital Patient Index Page

# As a visitor
# When I visit the hospitals show page 
# I see a link to view all of that hospitals patients 
# When I click that link
# I'm taken to a patients index page for that hospital 
# I see the names of all that hospital's patients listed from oldest to youngest
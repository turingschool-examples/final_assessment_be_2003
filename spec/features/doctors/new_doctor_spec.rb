require 'rails_helper'

RSpec.describe 'New Doctor Creation' do
  describe 'As a Visitor' do
    before :each do
      @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      @hospital2 = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

      @doctor1 = @hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
      @doctor2 = @hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
      @doctor3 = @hospital1.doctors.create!(name: "Bill", specialty: "Orthopedic Surgery", education: "Johns Hopkins University")
      @doctor4 = @hospital2.doctors.create!(name: "Tom", specialty: "Pediatric Surgery", education: "Johns Hopkins University")

      @patient1 = Patient.create!(name: "Katie Bryce", age: 24)
      @patient2 = Patient.create!(name: "Denny Duquette", age: 39)
      @patient3 = Patient.create!(name: "Rebecca Pope", age: 32)
      @patient4 = Patient.create!(name: "Zola  Shepherd", age: 2)

      @doctor_patient1 = DoctorPatient.create!(doctor: @doctor1, patient: @patient1)
      @doctor_patient2 = DoctorPatient.create!(doctor: @doctor1, patient: @patient2)
      @doctor_patient3 = DoctorPatient.create!(doctor: @doctor2, patient: @patient3)
      @doctor_patient4 = DoctorPatient.create!(doctor: @doctor2, patient: @patient4)
    end
    
    it 'I see a link to add a doctor from hospital show page' do
      visit hospital_path(@hospital1)
      
      click_link 'Add Doctor to Hospital'

      expect(current_path).to eq(new_hospital_doctor_path(@hospital1))
      expect(page).to have_content("New Doctor Hire for #{@hospital1.name}")
    end

    it 'I can create a new doctor with form' do
      visit new_hospital_doctor_path(@hospital1)

      name = 'Megans Marmalades'
      specialty = '123 Main St'
      education = "Denver"

      fill_in 'Name:', with: name
      fill_in 'Specialty:', with: specialty
      fill_in 'Education:', with: education

      click_button 'Hire Doctor'

      expect(current_path).to eq(hospital_path(@hospital1))

      within "#doctors" do
        expect(page).to have_content("Number of Doctors at Hospital: 4")
      end
    end
  end
end

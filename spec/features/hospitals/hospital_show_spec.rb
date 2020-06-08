require 'rails_helper'

RSpec.describe 'Hospital Show Page' do
  describe 'As a visitor' do
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

    it 'I see the hospitals name and address' do
      visit hospital_path(@hospital1)

      expect(page).to have_content(@hospital1.name)
      expect(page).to have_content("Address: #{@hospital1.address} #{@hospital1.city}, #{@hospital1.state} #{@hospital1.zip}")
      expect(page).to_not have_content(@hospital2.name)
    end

    it 'I see the number of doctors that work at this hospital' do
      visit hospital_path(@hospital1)

      within "#doctors" do
        expect(page).to have_content("Number of Doctors at Hospital: 3")
      end
    end

    it 'I see a unique list of universities that this hospitals doctors attended' do
      visit hospital_path(@hospital1)

      within "#universities" do
        expect(page).to have_content(@doctor1.education)
        expect(page).to have_content(@doctor2.education)
      end
    end
  end
end

# As a visitor
# When I visit a hospital's show page
# I see the hospital's name,street address, city, state, and zip
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended
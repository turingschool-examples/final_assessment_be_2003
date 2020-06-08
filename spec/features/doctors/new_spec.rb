require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a new doctor page' do

    before(:each) do
      @grey_sloan = Hospital.create(
        name: "Grey Sloan Memorial Hospital",
        address: "123 Save Lives Rd",
        city: "Seattle",
        state: "WA",
        zip: 98101
      )

      @seaside = Hospital.create(
        name: "Seaside Health & Wellness Center",
        address: "123 Private Practice Road",
        city: "Los Angeles",
        state: "CA",
        zip: 90001
      )

      # Doctors:
      @meredith = Doctor.create(
        name: "Meredith Grey",
        specialty: "General Surgery",
        university: "Harvard University",
        hospital_id: @grey_sloan.id
      )

      @alex = Doctor.create(
        name: "Alex Karev",
        specialty: "Pediatric Surgery",
        university: "Johns Hopkins University",
        hospital_id: @grey_sloan.id
      )

      @Jen = Doctor.create(
        name: "Jennifer",
        specialty: "Podiatric Surgery",
        university: "Harvard University",
        hospital_id: @grey_sloan.id
      )

      @miranda = Doctor.create(
        name: "Miranda Bailey",
        specialty: "General Surgery",
        university: "Stanford University",
        hospital_id: @seaside.id
      )

      @derek = Doctor.create(
        name: "Derek McDreamy Shepherd",
        specialty: "Attending Surgeon",
        university: "University of Pennsylvania",
        hospital_id: @seaside.id
      )

      # Patients:

      @katie = Patient.create(
        name: "Katie Bryce",
        age: 24
      )

      @denny = Patient.create(
        name: "Denny Duquette",
        age: 39
      )

      @rebecca = Patient.create(
        name: "Rebecca Pope",
        age: 32
      )

      @zola = Patient.create(
        name: "Zola  Shepherd",
        age: 2
      )

      DoctorPatient.create(
        patient_id: @katie.id,
        doctor_id: @meredith.id
      )

      DoctorPatient.create(
        patient_id: @denny.id,
        doctor_id: @meredith.id
      )
    end

    it 'I can create a new doctor' do
      visit "/hospitals/#{@grey_sloan.id}/doctors/new"

      expect(page).to have_title("New Doctor Hire for #{@grey_sloan.name}")

      fill_in "Name", with: "Taylor"
      fill_in "Specialty", with: "Infectious Disease"
      fill_in "University", with: "Virginia Tech"
      click_on "Create Doctor"

      expect(current_path).to eq("/hospitals/#{@grey_sloan.id}")
      expect(page).to have_content("Doctors Count: 4")
    end
  end
end

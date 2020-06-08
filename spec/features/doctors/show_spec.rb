require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a Doctors show page' do

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

    it 'I can see all of that doctors information' do
      visit "/doctors/#{@meredith.id}"

      expect(page).to have_content(@meredith.name)
      expect(page).to have_content(@meredith.specialty)
      expect(page).to have_content(@meredith.university)
      expect(page).to have_content(@grey_sloan.name)
      expect(page).to have_content(@denny.name)
      expect(page).to have_content(@katie.name)
      expect(page).to_not have_content(@zola.name)
    end

    it 'I can remove patients from a doctors caseload' do
      visit "/doctors/#{@meredith.id}"

      within("#patient-#{@katie.id}") do
        click_on "Remove Patient"
      end
      expect(page).to_not have_content("Katie Bryce")
    end

    it 'I can reassign that doctor to a different hospital' do
      visit "/doctors/#{@meredith.id}"

      expect(@meredith.hospital).to eq(@grey_sloan)

      click_on "Assign Meredith Grey to a Different Hospital"

      expect(current_path).to eq("/doctors/#{@meredith.id}/reassign")

      fill_in "doctor[hospital_id]", with: @seaside.id
      click_on "Add #{@meredith.name} to this hospital"

      expect(current_path).to eq("/doctors/#{@meredith.id}")
      expect(page).to have_content("Hospital: #{@seaside.name}")
      expect(@meredith.reload.hospital).to eq(@seaside)

    end
  end
end

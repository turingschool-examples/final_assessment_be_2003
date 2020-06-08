require 'rails_helper'

RSpec.describe "doctors creation " do
  describe "When I visit '/hopitals/:id' i see a link to make a new doctor" do
    it "I see all hospital info, and can add doctors" do
      hospital_1 = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101"})
      doctor_1 = Doctor.create({ name: 'Meredith Grey', specialty: "General Surgery", education: "Harvard University", hospital_id: hospital_1.id})
      patient_1 = Patient.create({name: "Katie Bryce", age: 24})
      patient_2 = Patient.create({name: "Denny Duquette", age: 39})
      DoctorPatient.create({doctor_id: doctor_1.id, patient_id: patient_1.id})
      DoctorPatient.create({doctor_id: doctor_1.id, patient_id: patient_2.id})

      visit "/hospitals/#{hospital_1.id}"
      expect(page).to have_content("Total Number of Doctors: 1")
      click_on "Add Doctor"
      expect(current_path).to eq("/hospitals/#{hospital_1.id}/doctors/new")
      expect(page).to have_content("New Doctor Hire for #{hospital_1.name}")
      fill_in :name, with: "Johny"
      fill_in :specialty, with: "Mood Healing"
      fill_in :education, with: "Dvery"
      click_on "Submit"
      expect(current_path).to eq("/hospitals/#{hospital_1.id}")
      expect(page).to have_content("Total Number of Doctors: 2")
    end
  end
end

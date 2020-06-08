require 'rails_helper'

RSpec.describe "Doctor show Page" do
  describe "When I visit the show page of a doctor i can change thier hospital" do
    it "I see hospital info, I see how many doctors work here and a list of thier univeristies" do
      hospital_1 = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101"})
      hospital_2 = Hospital.create({name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001"})
      doctor_1 = Doctor.create({ name: 'Meredith Grey', specialty: "General Surgery", education: "Harvard University", hospital_id: hospital_1.id})
      doctor_2 = Doctor.create({ name: 'Alex Karev', specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: hospital_1.id})
      doctor_3 = Doctor.create({ name: 'Alex Blurv', specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: hospital_1.id})
      patient_1 = Patient.create({name: "Katie Bryce", age: 24})
      patient_2 = Patient.create({name: "Denny Duquette", age: 39})
      DoctorPatient.create({doctor_id: doctor_1.id, patient_id: patient_1.id})
      DoctorPatient.create({doctor_id: doctor_1.id, patient_id: patient_2.id})
      DoctorPatient.create({doctor_id: doctor_2.id, patient_id: patient_2.id})

      visit "/doctors/#{doctor_1.id}"


      expect(page).to have_content(hospital_1.name)
      click_on "Assign #{doctor_1.name} to a Different Hospital"
      expect(current_path).to eq("/doctors/#{doctor_1.id}/edit")
      fill_in :hospital_id, with: "#{hospital_2.id}"
      click_on "Add #{doctor_1.name} to this hospital"
      expect(current_path).to eq("/doctors/#{doctor_1.id}")
      expect(page).to_not have_content(hospital_1.name)
      expect(page).to have_content(hospital_2.name)



    end
  end
end

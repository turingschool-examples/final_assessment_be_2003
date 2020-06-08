require 'rails_helper'

RSpec.describe "Hospital Show Page" do
  describe "When I visit '/hospitals/:id'" do
    it "I see hospital info, I see how many doctors work here and a list of thier univeristies" do
      hospital_1 = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101"})
      doctor_1 = Doctor.create({ name: 'Meredith Grey', specialty: "General Surgery", education: "Harvard University", hospital_id: hospital_1.id})
      doctor_2 = Doctor.create({ name: 'Alex Karev', specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: hospital_1.id})
      doctor_3 = Doctor.create({ name: 'Alex Blurv', specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: hospital_1.id})
      patient_1 = Patient.create({name: "Katie Bryce", age: 24})
      patient_2 = Patient.create({name: "Denny Duquette", age: 39})
      DoctorPatient.create({doctor_id: doctor_1.id, patient_id: patient_1.id})
      DoctorPatient.create({doctor_id: doctor_1.id, patient_id: patient_2.id})
      DoctorPatient.create({doctor_id: doctor_2.id, patient_id: patient_2.id})

      visit "/hospitals/#{hospital_1.id}"

      expect(page).to have_content("Total Number of Doctors: 3")
      expect(page).to have_content("Harvard University")
      expect(page).to have_content("Johns Hopkins University")
      expect(page).to have_content(hospital_1.name)
      expect(page).to have_content(hospital_1.address)
      expect(page).to have_content(hospital_1.city)
      expect(page).to have_content(hospital_1.state)
      expect(page).to have_content(hospital_1.zip)
    end
  end
end

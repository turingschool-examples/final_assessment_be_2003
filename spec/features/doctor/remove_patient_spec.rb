require 'rails_helper'

RSpec.describe "When i visit a doctors show page" do
  it "has a link next to each patients name to remove patient from the doctor" do

    hospital1 = Hospital.create(name: "Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city:"Seattle", state:"WA", zip: "98101")
    doctor1 = hospital1.doctors.create(name:"Merideth Grey", specialty: "General Surger", education: "harvard University")
    doctor2 = hospital1.doctors.create(name:"Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
    patient1 = Patient.create(name:"Katie Bryce", age: "24")
    patient2 = Patient.create(name: "Denny Duquette", age:"39")
    patient3 = Patient.create(name: "Rebecca Pope", age:"32")
    patient4 = Patient.create(name: "Zola Shepherd", age:"2")
    doctorpatient1 = DoctorPatient.create(doctor_id:doctor1.id,patient_id:patient1.id)
    doctorpatient2 = DoctorPatient.create(doctor_id:doctor1.id,patient_id:patient2.id)

    visit "/doctors/#{doctor1.id}"

    within ".patient-#{patient1.id}" do
      click_on "Remove Patient"
    end

    expect(current_path).to eq("/doctors/#{doctor1.id}")
    expect(page).to_not have_content("#{patient1.name}")

    expect(page).to have_content("#{patient2.name}")

  end

end

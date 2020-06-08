require 'rails_helper'

RSpec.describe "when i visit the hospitals show page" do
  it "has a link to the patients index page for the hospital and i see the names of all paitents listed from youngest to oldest" do

    hospital1 = Hospital.create(name: "Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city:"Seattle", state:"WA", zip: "98101")
    hospital2 = Hospital.create(name: "Seaside Health & Wellness Center", address:"123 Private Practive Road", city:"Los Angeles", state:"CA", zip: "90001")
    doctor1 = hospital1.doctors.create(name:"Merideth Grey", specialty: "General Surger", education: "harvard University")
    doctor2 = hospital1.doctors.create(name:"Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
    patient1 = Patient.create(name:"Katie Bryce", age: "24")
    patient2 = Patient.create(name: "Denny Duquette", age:"39")
    patient3 = Patient.create(name: "Rebecca Pope", age:"32")
    patient4 = Patient.create(name: "Zola Shepherd", age:"2")
    doctorpatient1 = DoctorPatient.create(doctor_id:doctor1.id,patient_id:patient1.id)
    doctorpatient2 = DoctorPatient.create(doctor_id:doctor1.id,patient_id:patient2.id)
    doctorpatient3 = DoctorPatient.create(doctor_id:doctor2.id,patient_id:patient1.id)
    doctorpatient4 = DoctorPatient.create(doctor_id:doctor2.id,patient_id:patient2.id)

    visit "/hospitals/#{hospital1.id}"
    click_on "Patients"
    expect(current_path).to eq("/hospitals/#{hospital1.id}/patients")

    expect(page).to have_content("#{patient1.name}")
    expect(page).to have_content("#{patient2.name}")
    expect(page).to_not have_content("#{patient3.name}")
    expect(page).to_not have_content("#{patient4.name}")

    expect("#{patient1.name}").to appear_before("#{patient2.name}")


  end

end

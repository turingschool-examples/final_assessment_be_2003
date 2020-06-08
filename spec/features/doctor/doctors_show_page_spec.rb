require 'rails_helper'

RSpec.describe "As a visitor" do
  it "in the doctor show page, i see all that doctors information" do

    hospital1 = Hospital.create(name: "Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city:"Seattle", state:"WA", zip: "98101")
    hospital2 = Hospital.create(name: "Seaside Health & Wellness Center", address:"123 Private Practive Road", city:"Los Angeles", state:"CA", zip: "90001")
    doctor1 = hospital1.doctors.create(name:"Merideth Grey", specialty: "General Surger", education: "harvard University")
    doctor2 = hospital2.doctors.create(name:"Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
    patient1 = Patient.create(name:"Katie Bryce", age: "24")
    patient2 = Patient.create(name: "Denny Duquette", age:"39")
    patient3 = Patient.create(name: "Rebecca Pope", age:"32")
    patient4 = Patient.create(name: "Zola Shepherd", age:"2")
    doctorpatient1 = DoctorPatient.create(doctor_id:doctor1.id,patient_id:patient1.id)
    doctorpatient2 = DoctorPatient.create(doctor_id:doctor1.id,patient_id:patient2.id)
    doctorpatient3 = DoctorPatient.create(doctor_id:doctor2.id,patient_id:patient3.id)
    doctorpatient4 = DoctorPatient.create(doctor_id:doctor2.id,patient_id:patient4.id)
    visit "/doctors/#{doctor1.id}"

    expect(page).to have_content("#{doctor1.name}")
    expect(page).to have_content("#{doctor1.specialty}")
    expect(page).to have_content("#{doctor1.education}")

    expect(page).to have_content("#{hospital1.name}")
    expect(page).to have_content("#{patient1.name}")
    expect(page).to have_content("#{patient2.name}")

    expect(page).to_not have_content("#{doctor2.name}")
    expect(page).to_not have_content("#{doctor2.specialty}")
    expect(page).to_not have_content("#{doctor2.education}")

    expect(page).to_not have_content("#{hospital2.name}")
    expect(page).to_not have_content("#{patient3.name}")
    expect(page).to_not have_content("#{patient4.name}")

  end

end

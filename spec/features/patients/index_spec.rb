require "rails_helper"

RSpec.describe "Hospital's Patients Index Page" do
  it "displays the patient's names from oldest to youngest" do
    memorial = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    seaside = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

    grey = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: memorial.id)
    bailey = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: memorial.id)
    karev = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: memorial.id)
    yang = Doctor.create(name: "Cristina Yang", specialty: "Cardiothoracic Surgery", education: "Stanford University", hospital_id: memorial.id)
    shepherd = Doctor.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: memorial.id)
    sloan = Doctor.create(name: "Mark McSteamy Sloan", specialty: "Plastic Surgeron", education: "University of Pennsylvania", hospital_id: memorial.id)
    avery = Doctor.create(name: "Jackson Avery", specialty: "Plastic Surgery", education: "Boston University", hospital_id: seaside.id)

    bryce = Patient.create(name: "Katie Bryce", age: 24)
    duqette = Patient.create(name: "Denny Duquette", age: 39)
    zola = Patient.create(name: "Zola Shepherd", age: 2)
    pope = Patient.create(name: "Rebecca Pope", age: 32)
    stevens = Patient.create(name: "Izzie Stevens", age: 33)

    DoctorPatient.create(doctor_id: karev.id, patient_id: pope.id)
    DoctorPatient.create(doctor_id: sloan.id, patient_id: pope.id)
    DoctorPatient.create(doctor_id: shepherd.id, patient_id: zola.id)
    DoctorPatient.create(doctor_id: karev.id, patient_id: zola.id)
    DoctorPatient.create(doctor_id: bailey.id, patient_id: duqette.id)
    DoctorPatient.create(doctor_id: grey.id, patient_id: bryce.id)
    DoctorPatient.create(doctor_id: yang.id, patient_id: duqette.id)

    visit "/hospitals/#{memorial.id}/patients"
    save_and_open_page
    expect("Denny Duquette").to appear_before("Rebecca Pope")
    expect("Rebecca Pope").to appear_before("Katie Bryce")
    expect("Katie Bryce").to appear_before("Zola Shepherd")
  end
end

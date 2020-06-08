require 'rails_helper'

describe 'Hospital patient index page' do
  it "shows a sorted list of the hospital's patients" do
    grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital",
                                 address: "123 Save Lives Rd",
                                 city: "Seattle",
                                 state: "WA",
                                 zip: "98101")

    seaside = Hospital.create(name: "Seaside Health & Wellness Center",
                              address: "123 Private Practice Rd",
                              city: "Los Angeles",
                              state: "CA",
                              zip: "90001")

    meredith = Doctor.create(name: "Meredith Grey",
                             specialty: "General Surgery",
                             education: "Harvard University",
                             hospital_id: grey_sloan.id)

    alex = Doctor.create(name: "Alex Karev",
                         specialty: "Pediatric Surgery",
                         education: "Johns Hopkins University",
                         hospital_id: grey_sloan.id)

    mcdreamy = Doctor.create(name: "Derek Shepherd",
                         specialty: "Attending Surgeon",
                         education: "University of Pennsylvania",
                         hospital_id: seaside.id)


    rebecca = Patient.create(name: "Rebecca Pope", age: 32)
    zola = Patient.create(name: "Zola Shepherd", age: 2)
    katie = Patient.create(name: "Katie Bryce", age: 24)
    denny = Patient.create(name: "Denny Duquette", age: 39)

    DoctorPatient.create(doctor_id: meredith.id, patient_id: rebecca.id)
    DoctorPatient.create(doctor_id: meredith.id, patient_id: zola.id)
    DoctorPatient.create(doctor_id: alex.id, patient_id: zola.id)
    DoctorPatient.create(doctor_id: mcdreamy.id, patient_id: katie.id)
    DoctorPatient.create(doctor_id: meredith.id, patient_id: denny.id)

    visit hospital_path(grey_sloan.id)
    click_link "See Patients"
    expect(current_path).to eq(hospital_patients_path(grey_sloan.id))

    expect(page).to have_content(rebecca.name)
    expect(page).to have_content(zola.name, count: 1)
    expect(page).to have_content(denny.name)
    expect(page).to_not have_content(katie.name)
    expect(rebecca.name).to appear_before(zola.name)
    expect(denny.name).to appear_before(rebecca.name)
  end
end

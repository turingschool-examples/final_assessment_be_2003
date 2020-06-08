require 'rails_helper'

describe 'Doctor show page' do
  it "shows all of a doctor's information" do
    grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital",
                                 address: "123 Save Lives Rd",
                                 city: "Seattle",
                                 state: "WA",
                                 zip: "98101")

    meredith = Doctor.create(name: "Meredith Grey",
                             specialty: "General Surgery",
                             education: "Harvard University",
                             hospital_id: grey_sloan.id)

    rebecca = Patient.create(name: "Rebecca Pope", age: 32)
    zola = Patient.create(name: "Zola Shepherd", age: 2)
    katie = Patient.create(name: "Katie Bryce", age: 24)

    DoctorPatient.create(doctor_id: meredith.id, patient_id: rebecca.id)
    DoctorPatient.create(doctor_id: meredith.id, patient_id: zola.id)

    visit doctor_path(meredith.id)
    expect(page).to have_content(meredith.name)
    expect(page).to have_content(meredith.specialty)
    expect(page).to have_content(meredith.education)
    expect(page).to have_content(grey_sloan.name)
    expect(page).to have_content(rebecca.name)
    expect(page).to have_content(zola.name)
    expect(page).to_not have_content(katie.name)
  end
end

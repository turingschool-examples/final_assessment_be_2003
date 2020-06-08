require 'rails_helper'

describe 'Patient delete page' do
  it "removes a patient from a doctor's caseload" do
    grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital",
                                 address: "123 Save Lives Rd",
                                 city: "Seattle",
                                 state: "WA",
                                 zip: "98101")

    meredith = Doctor.create(name: "Meredith Grey",
                             specialty: "General Surgery",
                             education: "Harvard University",
                             hospital_id: grey_sloan.id)

    alex = Doctor.create(name: "Alex Karev",
                         specialty: "Pediatric Surgery",
                         education: "Johns Hopkins University",
                         hospital_id: grey_sloan.id)

    rebecca = Patient.create(name: "Rebecca Pope", age: 32)
    zola = Patient.create(name: "Zola Shepherd", age: 2)

    DoctorPatient.create(doctor_id: meredith.id, patient_id: rebecca.id)
    DoctorPatient.create(doctor_id: meredith.id, patient_id: zola.id)
    DoctorPatient.create(doctor_id: alex.id, patient_id: zola.id)

    visit doctor_path(meredith.id)
    within ".patient-#{rebecca.id}" do
      expect(page).to have_button("Remove from Caseload")
    end
    within ".patient-#{zola.id}" do
      click_button "Remove from Caseload"
    end

    expect(current_path).to eq(doctor_path(meredith.id))
    expect(page).to have_content(rebecca.name)
    expect(page).to_not have_content(zola.name)

    expect(Patient.find(zola.id)).to eq(zola)
    visit doctor_path(alex.id)
    expect(page).to have_content(zola.name)
  end
end

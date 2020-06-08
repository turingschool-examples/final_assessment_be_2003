require 'rails_helper'

RSpec.describe 'Hospital patients index page', type: :feature do
  before(:each) do
    @seaside = Hospital.create(
    name: 'Seaside Health & Wellness Center',
    address: '123 Private Practice Road',
    city: 'Los Angeles',
    state: 'CA,',
    zip: 90001)

    @grey = Hospital.create(
    name: 'Grey Sloan Memorial Hospital',
    address: '123 Save Lives Rd',
    city: 'Seattle',
    state: 'WA',
    zip: 98101)

    @miranda =  Doctor.create(
    name: 'Miranda Bailey',
    specialty: 'General Surgery',
    education: 'Stanford University',
    hospital_id: @grey.id)

    @derek = Doctor.create(
    name: 'Derek McDreamy Shepherd',
    specialty: 'Attending Surgeon',
    education: 'University of Pennsylvania',
    hospital_id: @seaside.id)

    @jeff = Doctor.create(
    name: 'Jeff Shepherd',
    specialty: 'Attending Surgeon',
    education: 'University of Pennsylvania',
    hospital_id: @grey.id)

    @rebecca = Patient.create(
    name: 'Rebecca Pope',
    age: 32)

    @zola = Patient.create(
    name: 'Zola Shepherd',
    age: 2)

    @jessica = Patient.create(
    name: 'Jessica Smith',
    age: 12)

    @brad = Patient.create(
    name: 'Brad Smith',
    age: 13)



    PatientDoctor.create(patient_id: @rebecca.id, doctor_id: @miranda.id)
    PatientDoctor.create(patient_id: @zola.id, doctor_id: @miranda.id)
    PatientDoctor.create(patient_id: @zola.id, doctor_id: @derek.id)
    PatientDoctor.create(patient_id: @jessica.id, doctor_id: @derek.id)
    PatientDoctor.create(patient_id: @zola.id, doctor_id: @jeff.id)
    PatientDoctor.create(patient_id: @brad.id, doctor_id: @jeff.id)
  end
  it 'has names of all the hospital patients' do
    visit hospital_patients_path(@grey)

    expect(page).to have_content(@rebecca.name, count: 1)
    expect(page).to have_content(@brad.name, count: 1)
    expect(page).to have_content(@zola.name, count: 1)
    expect(page).to_not have_content(@jessica.name)
  end
end
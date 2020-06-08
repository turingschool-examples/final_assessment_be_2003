require 'rails_helper'

RSpec.describe 'Doctor show page', type: :feature do
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

    @rebecca = Patient.create(
    name: 'Rebecca Pope',
    age: 32)

    @zola = Patient.create(
    name: 'Zola Shepherd',
    age: 2)

    @miranda_rebecca = PatientDoctor.create(patient_id: @rebecca.id, doctor_id: @miranda.id)
    @miranda_zola = PatientDoctor.create(patient_id: @zola.id, doctor_id: @miranda.id)
    @derek_zola = PatientDoctor.create(patient_id: @zola.id, doctor_id: @derek.id)
  end

  it "shows all doctor information" do
    visit doctor_path(@miranda)
    expect(page).to have_content(@miranda.name)
    expect(page).to have_content(@miranda.specialty)
    expect(page).to have_content(@miranda.education)
    expect(page).to have_content(@grey.name)
    expect(page).to have_content(@rebecca.name)
    expect(page).to have_content(@zola.name)
  end

  it "will not show patients that do not belong to the doctor" do
    visit doctor_path(@derek)
    expect(page).to have_content(@derek.name)
    expect(page).to have_content(@derek.specialty)
    expect(page).to have_content(@derek.education)
    expect(page).to have_content(@seaside.name)
    expect(page).to have_content(@zola.name)
    expect(page).to_not have_content(@rebecca.name)
  end

  it 'has_buttons to remove patients from their caseload' do
    visit doctor_path(@derek)
    expect(page).to have_content(@zola.name)
    expect(page).to_not have_content(@rebecca.name)

    within ".patient-#{@derek_zola.id}" do
      expect(page).to have_button('Remove from caseload')
      click_button "Remove from caseload"
    end

    expect(current_path).to eq(doctor_path(@derek))
    expect(page).to_not have_content(@zola.name)
  end
end
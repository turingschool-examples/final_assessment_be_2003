require 'rails_helper'

RSpec.describe 'New doctor creation', type: :feature do
  before(:each) do
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
    hospital_id: @grey.id)

    @jeff = Doctor.create(
    name: 'Jeff Lastname',
    specialty: 'Attending Surgeon',
    education: 'University of Pennsylvania',
    hospital_id: @grey.id)
  end

  it 'can create a new doctor' do
    visit hospital_path(@grey)
    expect(page).to have_content("Number of Doctors: 3")
    expect(@grey.doctors).to eq([@miranda, @derek, @jeff])
    expect(page).to have_link("Add a doctor")
    click_link "Add a doctor"
    expect(current_path).to eq(new_hospital_doctor_path(@grey))
    
    fill_in :name, with: 'Bradley Cooper'
    fill_in :specialty, with: 'General Surgery'
    fill_in :education, with: 'University of California'
    click_button 'Submit'
    
    expect(current_path).to eq(hospital_path(@grey))
    expect(page).to have_content("Number of Doctors: 4")
  end
end

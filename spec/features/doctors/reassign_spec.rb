require 'rails_helper'

RSpec.describe 'New doctor creation', type: :feature do
  before(:each) do
    @grey = Hospital.create(
    name: 'Grey Sloan Memorial Hospital',
    address: '123 Save Lives Rd',
    city: 'Seattle',
    state: 'WA',
    zip: 98101)

    @seaside = Hospital.create(
    name: 'Seaside Health & Wellness Center',
    address: '123 Private Practice Road',
    city: 'Los Angeles',
    state: 'CA,',
    zip: 90001)

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
    visit doctor_path(@jeff)
    expect(page).to have_link("Assign Jeff Lastname to a Different Hospital")

    click_link "Assign Jeff Lastname to a Different Hospital"
    expect(current_path).to eq(edit_doctor_path(@jeff))
    
    fill_in :hospital_id, with: @seaside.id
    click_button "Add #{@jeff.name} to this hospital"
    
    expect(current_path).to eq(doctor_path(@jeff))
    expect(page).to have_content("Works at: #{@seaside.name}")
  end
end

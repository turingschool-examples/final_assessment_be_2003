require 'rails_helper'

RSpec.describe 'Hospital show page', type: :feature do
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

  it 'shows all hospital info' do
    visit hospital_path(@grey)
    expect(page).to have_content(@grey.name)
    expect(page).to have_content(@grey.address)
    expect(page).to have_content(@grey.city)
    expect(page).to have_content(@grey.state)
    save_and_open_page
  
    within(".doctor-info") do
      expect(page).to have_content('Number of Doctors: 3')
      expect(page).to have_content('Stanford University', count: 1)
      expect(page).to have_content('University of Pennsylvania', count: 1)
    end
  end
end

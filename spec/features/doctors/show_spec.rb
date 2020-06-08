require 'rails_helper'

RSpec.describe 'Doctor show page', type: :feature do
  before(:each) do
    @seaside = Hospital.create(
    name: 'Seaside Health & Wellness Center',
    address: '123 Private Practice Road',
    city: 'Los Angeles',
    state: 'CA,'
    zip: 90001)

    @grey = Hospital.create(
    name: 'Grey Sloan Memorial Hospital',
    address: '123 Save Lives Rd',
    city: 'Seattle',
    state: 'WA',
    zip: 98101)

    @miranda =  Doctor.create(
    Name: 'Miranda Bailey',
    Specialty: 'General Surgery',
    Education: 'Stanford University',
    hospital_id: @grey.id)

    @derek = Doctor.create(
    Name: 'Derek McDreamy Shepherd',
    Specialty: 'Attending Surgeon',
    Education: 'University of Pennsylvania',
    hospital_id: @seaside.id)

    @rebecca = Patient.create(
    Name: 'Rebecca Pope',
    Age: 32)

    @zola = Patient.create(
    Name: 'Zola  Shepherd',
    Age: 2)

  end
end
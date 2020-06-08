require 'rails_helper'

describe Hospital, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip}
  end

  describe "relationships" do
    it {should have_many :doctors}
  end

  describe "Instance Methods" do
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

    it 'number_of_doctors' do
      expect(@grey.number_of_doctors).to eq(3)
    end
  end
end

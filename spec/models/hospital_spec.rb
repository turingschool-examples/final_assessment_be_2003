require 'rails_helper'

RSpec.describe Hospital do
  describe 'Relationships' do
    it {should have_many :doctors}
  end

  # describe 'Validations' do
  # end

  describe 'instance methods' do
    before(:each) do
      @hospital = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
      @psych = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")
      @grey = @hospital.doctors.create(name: "Meredith Grey", speciality: "General Surgery", education: "Harvard University")
      @karev = @hospital.doctors.create(name: "Alex Karev", speciality: "Pediatric Surgery", education: "Johns Hopkins University")
      @martian = @hospital.doctors.create(name: "Marvin the Martian", speciality: "Outer Space", education: "Johns Hopkins University")
      @bunny = @psych.doctors.create(name: "Bugs Bunny", speciality: "Carrot Surgery", education: "Looney Tunes University")
    end

    it '#doctor_universities' do
      expect(@hospital.doctor_universities).to eq("#{@grey.education} and #{@karev.education}")
    end
  end
end

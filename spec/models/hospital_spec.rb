require 'rails_helper'

RSpec.describe Hospital, type: :model do
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

    describe "doctor_schools" do
        it "should return a unique list of schools attended by doctors at hospital" do

            seaside = Hospital.create!(name: "Seaside Health & Wellness Center",
                           address: "123 Private Practice Road",
                           city: "Los Angeles", 
                           state: "CA", 
                           zip: "90001")
                           
            miranda = seaside.doctors.create!(name: "Miranda Bailey",
                        specialty: "General Surgery",
                        education: "Stanford University")

            derek = seaside.doctors.create!(name: "Derek McDreamy Shepherd",
                                specialty: "Attending Surgeon",
                                education: "University of Pennsylvania")

            meredith = seaside.doctors.create!(name: "Meredith Grey",
                            specialty: "General Surgery", 
                            education: "University of Pennsylvania")

            expect(seaside.doctor_schools).to eq(["Stanford University", "University of Pennsylvania"])
        end 
    end 
end
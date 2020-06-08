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
    
    describe "all_patients_by_age" do 
        it "lists all patients at hospital by age, oldest to youngest" do

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

            katie = Patient.create!(name: "Katie Bryce",
                        age: 24)

            denny = Patient.create!(name: "Denny Duquette",
                                    age: 39)

            rebecca = Patient.create!(name: "Rebecca Pope",
                                    age: 32)

            zola = Patient.create!(name: "Zola Shepherd",
                                age: 2)

            DoctorPatient.create!(doctor: miranda, patient: katie)
            DoctorPatient.create!(doctor: derek, patient: denny)
            DoctorPatient.create!(doctor: meredith, patient: rebecca)
            DoctorPatient.create!(doctor: meredith, patient: zola)

            expect(seaside.all_patients_by_age).to eq([denny, rebecca, katie, zola])
        end 
    end 
end
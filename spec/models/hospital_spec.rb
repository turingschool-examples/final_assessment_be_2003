require 'rails_helper'

RSpec.describe Hospital do
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

  describe 'methods' do 
    before do
    @seaside = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: 90001 )
    @miranda = @seaside.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
    @mcdreamy = @seaside.doctors.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")
    @rebecca_p = @mcdreamy.patients.create(name: "Rebecca Pope", age: 32)
    @zola = @mcdreamy.patients.create(name: "Zola Shepherd", age: 2)
    @rico = @mcdreamy.patients.create(name: "Rico Suave", age: 22)
    @mimi = @mcdreamy.patients.create(name: "Mimi Mimison", age: 88) 

    end
    it "#unique_doctor_educations" do
      expect(@seaside.unique_doctor_educations).to eq(["Stanford University", "University of Pennsylvania"])
    end
    
    it "#all_patients_sorted_by_age" do 
      expect(@seaside.all_patients_sorted_by_age).to eq([@mimi, @rebecca_p, @rico, @zola])
    end
  end  
end
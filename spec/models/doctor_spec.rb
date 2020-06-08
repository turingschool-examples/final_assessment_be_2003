require 'rails_helper'

RSpec.describe Doctor do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :specialty}
    it {should validate_presence_of :education}
  end
  describe "relationships" do
    it {should belong_to :hospital}
    it {should have_many :doctor_patients}
    it { should have_many(:patients).through(:doctor_patients)}
  end
  describe "methods " do
    it 'unique_education' do
      @grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city:"Seatle", state: "WA", zip: "98101")

      @grey = @grey_sloan.doctors.create(name:  "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
      @karev = @grey_sloan.doctors.create(name:  "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")

      expect(@grey_sloan.doctors.unique_education).to eq("Harvard University, Johns Hopkins University")
    end
  end
end

# rails g migration CreateDoctorPatients doctor:references patient:references
# rails g migration CreatePatients name:string age:integer
# rails g migration CreateDoctors name:string specialty:string education:string hospital:references
# rails g migration CreateHospital name:string address:string city:string state:string zip:string

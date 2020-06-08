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
end

# rails g migration CreateDoctorPatients doctor:references patient:references
# rails g migration CreatePatients name:string age:integer
# rails g migration CreateDoctors name:string specialty:string education:string hospital:references
# rails g migration CreateHospital name:string address:string city:string state:string zip:string

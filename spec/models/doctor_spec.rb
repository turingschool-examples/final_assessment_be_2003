require 'rails_helper'

describe Doctor do
  describe 'Relationships' do
    it {should belong_to :hospital}
    it {should have_many :doctor_patients}
    it {should have_many(:patients).through(:doctor_patients)}
  end

  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :specialty}
    it {should validate_presence_of :university}
  end

  describe 'Class Methods' do

    before(:each) do
      @grey_sloan = Hospital.create(
        name: "Grey Sloan Memorial Hospital",
        address: "123 Save Lives Rd",
        city: "Seattle",
        state: "WA",
        zip: 98101
      )

      @seaside = Hospital.create(
        name: "Seaside Health & Wellness Center",
        address: "123 Private Practice Road",
        city: "Los Angeles",
        state: "CA",
        zip: 90001
      )

      # Doctors:
      @meredith = Doctor.create(
        name: "Meredith Grey",
        specialty: "General Surgery",
        university: "Harvard University",
        hospital_id: @grey_sloan.id
      )
      @alex = Doctor.create(
        name: "Alex Karev",
        specialty: "Pediatric Surgery",
        university: "Johns Hopkins University",
        hospital_id: @grey_sloan.id
      )
      @jen = Doctor.create(
        name: "Jennifer",
        specialty: "Podiatric Surgery",
        university: "Harvard University",
        hospital_id: @grey_sloan.id
      )
      @miranda = Doctor.create(
        name: "Miranda Bailey",
        specialty: "General Surgery",
        university: "Stanford University",
        hospital_id: @seaside.id
      )
      @derek = Doctor.create(
        name: "Derek McDreamy Shepherd",
        specialty: "Attending Surgeon",
        university: "University of Pennsylvania",
        hospital_id: @seaside.id
      )

      # Patients:

      @katie = Patient.create(
        name: "Katie Bryce",
        age: 24
      )
      @denny = Patient.create(
        name: "Denny Duquette",
        age: 39
      )
      @rebecca = Patient.create(
        name: "Rebecca Pope",
        age: 32
      )
      @zola = Patient.create(
        name: "Zola  Shepherd",
        age: 2
      )

      DoctorPatient.create(
        patient_id: @katie.id,
        doctor_id: @meredith.id
      )
      DoctorPatient.create(
        patient_id: @denny.id,
        doctor_id: @meredith.id
      )
      DoctorPatient.create(
        patient_id: @zola.id,
        doctor_id: @meredith.id
      )
      DoctorPatient.create(
        patient_id: @katie.id,
        doctor_id: @alex.id
      )
      DoctorPatient.create(
        patient_id: @denny.id,
        doctor_id: @alex.id
      )
    end

    it 'unique_universities' do
      doctors = @grey_sloan.doctors
      universities = [@meredith.university, @alex.university]
      expect(doctors.unique_universities).to eq(universities)
    end

  end
end

require "rails_helper"

RSpec.describe "Doctors show page", type: :feature do
  before :each do
    @hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101" )
    @hospital_2 = Hospital.create!(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")
    @doc_1 = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: @hospital_1.id)
    @doc_2 = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: @hospital_1.id)
    @doc_3 = Doctor.create!(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: @hospital_2.id)
    @doc_4 = Doctor.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: @hospital_2.id)
    @patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
    @patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
    @patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
    @patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)

    PatientDoctor.create!(doctor_id: @doc_1.id, patient_id: @patient_1.id)
    PatientDoctor.create!(doctor_id: @doc_1.id, patient_id: @patient_2.id)
    PatientDoctor.create!(doctor_id: @doc_1.id, patient_id: @patient_3.id)
    PatientDoctor.create!(doctor_id: @doc_2.id, patient_id: @patient_1.id)
    PatientDoctor.create!(doctor_id: @doc_2.id, patient_id: @patient_3.id)
  end

  it "Story-1: Doctors info, hospital and patients are displayed" do
    visit "/doctors/#{@doc_1.id}"

    expect(page).to have_content("#{@doc_1.name}")
    expect(page).to have_content("#{@doc_1.specialty}")
    expect(page).to have_content("#{@doc_1.education}")
    expect(page).to have_content("#{@hospital_1.name}")
    expect(page).to have_content("#{@patient_1.name}")
    expect(page).to have_content("#{@patient_2.name}")
    expect(page).to have_content("#{@patient_3.name}")
  end

end

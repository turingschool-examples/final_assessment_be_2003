require 'rails_helper'

RSpec.describe "hospital show page", type: :feature do
  before(:each) do
    @grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city:"Seatle", state: "WA", zip: "98101")
    @seaside = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city:"Los Angeles", state: "CA", zip: "90001")

    @grey = @grey_sloan.doctors.create(name:  "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    @karev = @grey_sloan.doctors.create(name:  "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")

    @jen = Patient.create(name: "Jen Ducket", age: 19)
    @erik = Patient.create(name: "Erik Palladino", age: 22)
    @ethan = Patient.create(name: "Ethan Embry", age: 21)
    @lauren = Patient.create(name: "Lauren Ambrose", age: 18)

    DoctorPatient.create(doctor_id: @grey.id, patient_id: @jen.id)
    DoctorPatient.create(doctor_id: @grey.id, patient_id: @erik.id)
    DoctorPatient.create(doctor_id: @karev.id, patient_id: @jen.id)
    DoctorPatient.create(doctor_id: @karev.id, patient_id: @ethan.id)
    DoctorPatient.create(doctor_id: @karev.id, patient_id: @lauren.id)
    visit "/hospitals/#{@grey_sloan.id}"
  end

  it "can see hospital's info" do
      expect(page).to have_content(@grey_sloan.name)
      expect(page).to have_content(@grey_sloan.address)
      expect(page).to have_content(@grey_sloan.city)
      expect(page).to have_content(@grey_sloan.state)
      expect(page).to have_content(@grey_sloan.zip)
  end

  it "see count of doctors and list of universities" do
    expect(page).to have_content("Number of Doctors: 2")
    expect(page).to have_content("Universities attended: Harvard University, Johns Hopkins University")
  end
  it "see link to patients" do
    click_link "View all patients of Grey Sloan Memorial Hospital"
    expect(current_path).to eq("/hospitals/#{@grey_sloan.id}/patients")
    expect(@lauren.name).to appear_before(@jen.name)
    expect(@jen.name).to appear_before(@ethan.name)
    expect(@ethan.name).to appear_before(@erik.name)
  end
end

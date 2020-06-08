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
  it "can add a doctor" do
    click_link "Add Doctor to Hospital"
    expect(current_path).to eq("/hospitals/#{@grey_sloan.id}/doctors/new")
    expect(page).to have_content("New Doctor Hire for Grey Sloan Memorial Hospital")

     fill_in "Name", with: "Noris McDuffy"
     fill_in "Specialty", with: "Genetics"
     fill_in "Education", with: "University of Phoenix"
     click_button "Submit"
     
     expect(current_path).to eq("/hospitals/#{@grey_sloan.id}")
     expect(page).to have_content("Number of Doctors: 3")
  end
end
#
# User Story 4, Creating a Doctor
# As a visitor
# When I visit a hospital's show page
# I see a link to add a doctor for this hospital
# When I click that link
# I'm taken to a page that has a title of "New Doctor Hire for <insert hospital name here>"
# And on that page there's a form for me to enter a new doctor's name, specialty, and university where they got their doctorate.
# When I fill out all three fields and click submit
# I am taken back to the hospital show page
# And I can see that the number of doctors has increased by one

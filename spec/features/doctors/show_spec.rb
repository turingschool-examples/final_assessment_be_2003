require 'rails_helper'

RSpec.describe "doctors show page", type: :feature do
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
    visit "/doctors/#{@grey.id}"
  end

  it "can see doctor's info" do
      expect(page).to have_content(@grey.name)
      expect(page).to have_content(@grey.specialty)
      expect(page).to have_content(@grey.education)
  end

  it "list of all its patients" do
    expect(page).to have_content(@jen.name)
    expect(page).to have_content(@erik.name)
  end
  it "remove patient from that doctor's caseload" do

    expect(page).to have_content(@jen.name)
    within ("#patient-#{@jen.id}")do

      click_link "remove"
    end
    visit "/doctors/#{@grey.id}"
    expect(page).not_to have_content(@jen.name)
  end
  
  it "reassign doctor to another hospital" do
    click_link "Assign Meredith Grey to a Different Hospital"
    expect(current_path).to eq("/doctors/#{@grey.id}/edit")
    fill_in 'Hospital ID', with: "#{@seaside.id}"

    click_link "Add #{@grey.name} to this hospital"
    expect(current_path).to eq("/doctors/#{@grey.id}")

    expect(page).not_to have_content(@grey_sloan.name)
    expect(page).to have_content(@seaside.name)
  end
end
# User Story 6, Reassign Doctor to Different Hospital
# As a visitor
# When I visit a doctor's show page
# Next to the name of the hospital where this doctor works
# I see a link that says "Assign <insert name of doctor> to a Different Hospital"
# When I click on that link
# I'm taken to a form where I can input an id of an existing hospital
# When I click "Add <insert name of doctor> to this hospital"
# I'm taken back to that doctor's show page
# And I can see the name of the new hospital that they were assigned to

# User Story 5, Remove a Patient from a Doctor
# As a visitor
# When I visit a Doctor's show page
# Next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed

# User Story 1, Doctors Show Page
# 'As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
#  - name
#  - specialty
#  - university where they got their doctorate
# And I see the name of the hospital where this doctor works
# And I see the names of all of the patients this doctor has

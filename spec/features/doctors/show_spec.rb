require 'rails_helper'

RSpec.describe "Doctor's Show Page" do
  it "displays the information about the doctor and lists patients treated" do
    memorial = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
    karev = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: memorial.id)
    pope = Patient.create(name: "Rebecca Pope", age: 32)
    zola = Patient.create(name: "Zola Shepherd", age: 2)
    DoctorPatient.create(doctor_id: karev.id, patient_id: pope.id)
    DoctorPatient.create(doctor_id: karev.id, patient_id: zola.id)

    visit "/doctors/#{karev.id}"

    expect(page).to have_content("Alex Karev")
    expect(page).to have_content("Specialty: Pediatric Surgery")
    expect(page).to have_content("Education: Johns Hopkins University")
    expect(page).to have_content("Work: Grey Sloan Memorial Hospital")
    expect(page).to have_content("Rebecca Pope")
    expect(page).to have_content("Zola Shepherd")
  end
end







# User Story 1, Doctors Show Page
# 'As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
#  - name
#  - specialty
#  - university where they got their doctorate
# And I see the name of the hospital where this doctor works
# And I see the names of all of the patients this doctor has

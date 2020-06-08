require "rails_helper"

RSpec.describe "Doctors Show Page", type: :feature do
  it "Can display doctors information, their patients, and hospital" do
    hospital = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: 98101})
    meredith = Doctor.create({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: "#{hospital.id}"})
    alex = Doctor.create({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: "#{hospital.id}"})
    katie = Patient.create({name: "Katie Bryce", age: 24})
    denny = Patient.create({name: "Denny Duquette", age: 39})
    rebecca = Patient.create({name: "Rebecca Pope", age: 32})
    zola = Patient.create({name: "Zola  Shepherd", age: 2})
    meredith.patients << rebecca
    meredith.patients << katie
    meredith.patients << denny
    alex.patients << zola
    visit "/doctors/#{meredith.id}"
    expect(page).not_to have_content(alex.name)
    expect(page).to have_content(meredith.name)
    expect(page).to have_content(meredith.specialty)
    expect(page).to have_content(meredith.education)
    expect(page).to have_content(hospital.name)
    expect(page).to have_content(katie.name)
    expect(page).to have_content(rebecca.name)
    expect(page).to have_content(denny.name)
    expect(page).to_not have_content(zola.name)
  end

  it "can delete a patient from doctors caseload" do

    hospital = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: 98101})
    meredith = Doctor.create({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: "#{hospital.id}"})
    alex = Doctor.create({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: "#{hospital.id}"})
    katie = Patient.create({name: "Katie Bryce", age: 24})
    denny = Patient.create({name: "Denny Duquette", age: 39})
    rebecca = Patient.create({name: "Rebecca Pope", age: 32})
    zola = Patient.create({name: "Zola  Shepherd", age: 2})
    meredith.patients << rebecca
    meredith.patients << katie
    meredith.patients << denny
    visit "/doctors/#{meredith.id}"

    within ".patient-#{rebecca.id}" do
      click_button "Delete Patient"
    end
    expect(current_path).to eql("/doctors/#{meredith.id}")
    expect(page).not_to have_css("patient-#{rebecca.id}")
    expect(page).not_to have_content("#{rebecca.name}")
  end

  it "Can reassign doctors to a different hospital" do
    hospital = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: 98101})
    hospital_1 = Hospital.create({name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: 90001})
    meredith = Doctor.create({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: "#{hospital.id}"})
    alex = Doctor.create({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: "#{hospital.id}"})
    katie = Patient.create({name: "Katie Bryce", age: 24})
    denny = Patient.create({name: "Denny Duquette", age: 39})
    rebecca = Patient.create({name: "Rebecca Pope", age: 32})
    zola = Patient.create({name: "Zola  Shepherd", age: 2})
    meredith.patients << rebecca
    meredith.patients << katie
    meredith.patients << denny

    visit "/doctors/#{meredith.id}"
    expect(page).to have_content("#{hospital.name}")
    click_link "Assign #{meredith.name} to a Different Hospital"
    expect(current_path).to eql("/doctors/#{meredith.id}/edit")
    fill_in :id, with: "#{hospital_1.id}"
    click_on "Add #{meredith.name} to this hospital"
    expect(current_path).to eql("/doctors/#{meredith.id}")
    expect(page).to have_content("#{hospital_1.name}")
    expect(page).to_not have_content("#{hospital.name}")
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

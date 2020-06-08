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



# As a visitor
# When I visit a Doctor's show page
# Next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed

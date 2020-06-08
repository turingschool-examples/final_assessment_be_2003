require 'rails_helper'

RSpec.describe "As a visitor when i visit a hospitals show page" do
  it "shows the hospital's name, street address, city, state, zip, number of docotrs, unique list of universities" do

    hospital1 = Hospital.create(name: "Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city:"Seattle", state:"WA", zip: "98101")
    doctor1 = hospital1.doctors.create(name:"Merideth Grey", specialty: "General Surger", education: "harvard University")
    doctor2 = hospital1.doctors.create(name:"Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
    doctor3 = hospital1.doctors.create(name:"Doctor", specialty: "surgeon", education:"harvard University")


    visit "/hospitals/#{hospital1.id}"

    expect(page).to have_content("#{hospital1.name}")
    expect(page).to have_content(2)
    expect(page).to have_content(doctor1.education)
    expect(page).to have_content(doctor2.education)

  end

end

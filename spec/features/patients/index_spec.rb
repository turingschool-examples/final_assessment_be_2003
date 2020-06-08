require 'rails_helper'

RSpec.describe "Hospital Patient index Page" do
  before :each do
    @hospital1 = Hospital.create(name:"Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101" )
    @hospital2 = Hospital.create(name:"Seaside Health & Wellness Center", address:"123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001" )

    @doctor1 = @hospital1.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    @doctor2 = @hospital2.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")

    @patient1 = Patient.create(name: "Katie Bryce", age: 24)
    @patient2 = Patient.create(name: "Denny Duquette", age: 39)
    @patient3 = Patient.create(name: "Rebecca Pope", age: 32)
    @patient4 = Patient.create(name: "Zola  Shepherd", age: 2)

    @doctor1.patients << @patient1
    @doctor1.patients << @patient2
    @doctor1.patients << @patient3
    @doctor2.patients << @patient4

  end
  it "US3 Hospital show has link to patients, patient index has patients names old to young" do
    visit hospital_path(@hospital1)

    click_link "View Patients at #{@hospital1.name}"
    expect(current_path).to eq(hospital_patients_path(@hospital1))

    expect(page).to_not have_content(@patient4.name)

    within("#patients")do
      expect(page.all('p')[0]).to have_content(@patient2.name)
      expect(page.all('p')[1]).to have_content(@patient3.name) 
      expect(page.all('p')[2]).to have_content(@patient1.name) 
    end

  end
  

end#final


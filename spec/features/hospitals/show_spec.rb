require 'rails_helper'

RSpec.describe "Hospital Show Page" do
  before :each do
    @hospital1 = Hospital.create(name:"Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101" )
    @hospital2 = Hospital.create(name:"Seaside Health & Wellness Center", address:"123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001" )

    @doctor1 = @hospital1.doctors.create(name: "Meredith Grey1", specialty: "General Surgery", education: "Harvard University")
    @doctor2 = @hospital1.doctors.create(name: "Meredith Grey2", specialty: "General Surgery", education: "Boston University")
    @doctor3 = @hospital1.doctors.create(name: "Meredith Grey3", specialty: "General Surgery", education: "Harvard University")
    @doctor4 = @hospital1.doctors.create(name: "Meredith Grey4", specialty: "General Surgery", education: "Turing")
    @doctor5 = @hospital2.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")

  end
  it "US2 Hospital show has info, number of doctors, and uniq list of universities" do
    visit hospital_path(@hospital1)

    within("#hospital-info")do
      expect(page).to have_content("Name: #{@hospital1.name}")
      expect(page).to have_content("Street Address: #{@hospital1.address}")
      expect(page).to have_content("City: #{@hospital1.city}")
      expect(page).to have_content("State: #{@hospital1.state}")
      expect(page).to have_content("Zip: #{@hospital1.zip}")
      expect(page).to_not have_content("Name: #{@hospital2.name}")
      expect(page).to_not have_content("Street Address: #{@hospital2.address}")
      expect(page).to_not have_content("City: #{@hospital2.city}")
      expect(page).to_not have_content("State: #{@hospital2.state}")
      expect(page).to_not have_content("Zip: #{@hospital2.zip}")
    end

    within("#doctor-info")do
      expect(page).to have_content("Number of Doctors: #{@hospital1.doctor_count}")
      expect(page).to have_content("Universities Attended: #{@hospital1.uniq_universities}")
    end
  end
  it "US4 Create a doctor - link to create doctor and doctor count increases" do
    visit hospital_path(@hospital1)
    expect(page).to have_content("Number of Doctors: 4")

    click_link("Add New Doctor")

    expect(current_path).to eq(new_hospital_doctor_path(@hospital1))
    expect(page).to have_content("New Doctor Hire for #{@hospital1.name}")

    within("#new-doctor-form")do
      fill_in "doctor[name]",	with: "Bugs Bunny" 
      fill_in "doctor[specialty]",	with: "Pediatrics" 
      fill_in "doctor[education]",	with: "ACME University" 

      click_on "Create Doctor"
    end
    expect(current_path).to eq(hospital_path(@hospital1))
    expect(page).to have_content("Number of Doctors: 5")
  end
 
  it "US4 SAD PATH: if all doctor info is not filled out, redirect to new doctor page" do
    visit hospital_path(@hospital1)
    expect(page).to have_content("Number of Doctors: 4")

    click_link("Add New Doctor")
    
    expect(page).to have_content("New Doctor Hire for #{@hospital1.name}")

    within("#new-doctor-form")do
      fill_in "doctor[name]",	with: "Daffy Duck" 
      fill_in "doctor[specialty]",	with: "" 
      fill_in "doctor[education]",	with: "" 

      click_on "Create Doctor"
    end

    doctor = Doctor.last
    expect(doctor.name).to_not eq("Daffy Duck")
    expect(current_path).to eq(new_hospital_doctor_path(@hospital1))

    visit hospital_path(@hospital1)
    expect(page).to have_content("Number of Doctors: 4")
  end
  

end#final

# When I visit a hospital's show page
# I see a link to add a doctor for this hospital
# When I click that link
# I'm taken to a page that has a title of "New Doctor Hire for <insert hospital name here>"
# And on that page there's a form for me to enter a new doctor's name, specialty, and university where they got their doctorate.
# When I fill out all three fields and click submit
# I am taken back to the hospital show page 
# And I can see that the number of doctors has increased by one
require 'rails_helper'

RSpec.describe "When I visit a doctor's show page" do
  before(:each) do
    @grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: 98101 )
    @seaside = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: 90001 )
    @miranda = @seaside.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
    @mcdreamy = @seaside.doctors.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")
    @rebecca_p = @mcdreamy.patients.create(name: "Rebecca Pope", age: 32)
    @zola = @mcdreamy.patients.create(name: "Zola Shepherd", age: 2)
    @rico = @mcdreamy.patients.create(name: "Rico Suave", age: 22)
    @mimi = @mcdreamy.patients.create(name: "Mimi Mimison", age: 88)
  end
  it "I see all of that doctor's information and patients" do 

    visit "/doctors/#{@mcdreamy.id}"

    expect(page).to have_content(@mcdreamy.name)
    expect(page).to have_content("Specialty: #{@mcdreamy.specialty}")
    expect(page).to have_content("Education: #{@mcdreamy.education}")
    expect(page).to have_content("Hospital: #{@seaside.name}")
    expect(page).to have_content("Rebecca Pope")
    expect(page).to have_content("Zola Shepherd")
    expect(page).to have_content("Rico Suave")
    expect(page).to have_content("Mimi Mimison")
    expect(page).to_not have_content(@miranda.name)
  end

  it "Next to each patient's name, I see a button to remove that patient from that doctor's caseload" do 

    visit "/doctors/#{@mcdreamy.id}"

    within("#patient-#{@zola.id}") do
      click_button("Delete Patient")
    end

    expect(page).to_not have_content("Zola Shepherd")
  end
end

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
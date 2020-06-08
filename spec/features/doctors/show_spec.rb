require 'rails_helper'
RSpec.describe "when visiting a doctors show page" do
  before :each do
    @greys = Hospital.create!(name: "Grey Sloan Memorial Hospital",
    address: "123 Save Lives Rd",
    city: "Seattle",
    state: "WA",
    zip: 98101)


    @meredith = @greys.doctors.create!(name: "Meredith Grey",
                              specialty: "General Surgery",
                              education: "Harvard University")


    @katie = @meredith.patients.create!(name: "Katie Bryce",
                                        age: 24)
    @denny = @meredith.patients.create!(name: "Denny Duquette",
                                        age: 39)
    @rebecca = @meredith.patients.create!(name: "Rebecca Pope",
                                          age: 32)
  end
  it "a visitor will see all doctors info, hospital & patients" do
    visit "/doctors/#{@meredith.id}"

    expect(page).to have_content(@meredith.name)
    expect(page).to have_content(@meredith.specialty)
    expect(page).to have_content(@meredith.education)
    expect(page).to have_content(@meredith.hospital.name)
    expect(page).to have_content(@meredith.patients.first.name)
    expect(page).to have_content(@meredith.patients.last.name)
  end

end
# '```
# User Story 1, Doctors Show Page
# 'As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
#  - name
#  - specialty
#  - university where they got their doctorate
# And I see the name of the hospital where this doctor works
# And I see the names of all of the patients this doctor has
# ```

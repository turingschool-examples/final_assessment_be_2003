require 'rails_helper'

RSpec.describe "When I visit a doctor's show page" do
  before(:each) do
    @grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: 98101 )
    @seaside = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: 90001 )
    @merideth = @grey_sloan.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    @alex = @grey_sloan.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
    @miranda = @seaside.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
    @mcdreamy = @seaside.doctors.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")
    @katie_b = @grey_sloan.patients.create(name: "Katie Bryce", age: 24)
    @denny_d = @grey_sloan.patients.create(name: "Denny Duquette", age: 39)
    @rebecca_p = @seaside.patients.create(name: "Rebecca Pope", age: 32)
    @denny_d = @seaside.patients.create(name: "Zola Shepherd", age: 2)
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
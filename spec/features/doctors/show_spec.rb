require "rails_helper"

Rspec.describe "Doctor show page" do
  general = Hospital.create!()
  meredith = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")

  it "as a visitor I see doctors info" do

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

require 'rails_helper'

RSpec.describe "Doctors Show Page" do
  describe "When I a doctors show page" do
    it "Can see hospitals name, address, number of doctors, and unique list of universities the doctors attended" do
      grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital",
                                address: "123 Save Lives Road",
                                city: "Seattle",
                                state: "WA",
                                zip:"98101"
                              )

      meridith = grey_sloan.doctors.create(name: "Meredith Grey",
                            specialty: "General Surgery",
                            education: "Harvard University"
                          )
      alex = grey_sloan.doctors.create(name: "Alex Karev",
                            specialty: "Pediatric Surgery",
                            education: "Johns Hopkins University"
                          )

      visit "/hospitals/#{grey_sloan.id}"

      expect(page).to have_content("Grey Sloan Memorial Hospital")
      expect(page).to have_content("123 Save Lives Road")
      expect(page).to have_content("Seattle")
      expect(page).to have_content("WA")
      expect(page).to have_content("98101")
      expect(page).to have_content(2)
      expect(page).to have_content("Harvard University")
      expect(page).to have_content("Johns Hopkins University")

    end
  end
end


# User Story 2, Hospital Show Page
# "As a visitor
# When I visit a hospital's show page
# I see the hospital's name, street address, city, state, and zip
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended

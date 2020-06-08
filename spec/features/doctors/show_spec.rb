require 'rails_helper'

RSpec.describe "Doctors Show Page" do
  describe "When I a doctors show page" do
    it "Can see doctors name, specialty, university, the hospital they work at, and names of all their patients" do
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

      katie = Patient.create(name: "Katie Bryce",
                          age: 24 )

      denny = Patient.create(name: "Denny Daquette",
                            age: 39 )

      DoctorPatient.create!(patient: katie, doctor: alex)
      DoctorPatient.create!(patient: denny, doctor: alex)

      visit "/doctors/#{alex.id}"
      expect(page).to have_content("Alex Karev")
      expect(page).to have_content("Pediatric Surgery")
      expect(page).to have_content("Johns Hopkins University")
      expect(page).to have_content("Grey Sloan Memorial Hospital")
      expect(page).to have_content("Katie Bryce")
      expect(page).to have_content("Denny Daquette")
      expect(page).to_not have_content("Meredith Grey")
    end
  end
end

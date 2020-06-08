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
      within(".doctors") do
        expect(page).to have_content(2)
      end

      within(".doc_univ") do
        expect(page).to have_content("Harvard University")
        expect(page).to have_content("Johns Hopkins University")
      end

    end

    it "Can see a link to all the hospitals patients" do
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

      visit "/hospitals/#{grey_sloan.id}"

      expect(page).to have_link("This Hospital's Patients")

      click_on "This Hospital's Patients"

      expect(current_path).to eq("/hospitals/#{grey_sloan.id}/patients")
      expect(page).to have_content("Katie Bryce")
      expect(page).to have_content("Denny Daquette")

    end

    it "Can see a link to add a new doctor" do
      grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital",
                                address: "123 Save Lives Road",
                                city: "Seattle",
                                state: "WA",
                                zip:"98101"
                              )

      meridith = Doctor.create(name: "Meredith Grey",
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


      visit "/hospitals/#{grey_sloan.id}"

      expect(page).to have_link("Add Doctor")

      name = "Meredith Grey"
      specialty = "General Surgery"
      education = "Harvard University"

      click_on "Add Doctor"
      expect(current_path).to eq("/hospitals/#{grey_sloan.id}/doctor/new")

      expect(page).to have_content("New Doctor Hire for #{grey_sloan.name}")

    end
  end
end
# I'm taken to a page that has a title of "New Doctor Hire for <insert hospital name here>"
# And on that page there's a form for me to enter a new doctor's name, specialty, and university where they got their doctorate.
# When I fill out all three fields and click submit
# I am taken back to the hospital show page
# And I can see that the number of doctors has increased by one

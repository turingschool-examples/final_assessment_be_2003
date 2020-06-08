require 'rails_helper'

RSpec.describe "Hospital Show Page" do
  before(:each) do
    @sloan = Hospital.create(name: "Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city: "Seattle", state: "WA", zipcode: "98101")
    @seaside = Hospital.create(name:"Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zipcode: "90001")

    @meredith = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: @sloan.id)
    @derek = Doctor.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: @sloan.id)
    @bob = Doctor.create(name: "Bob", specialty: "General Surgery", education: "Harvard University", hospital_id: @sloan.id)

    @miranda = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: @seaside.id)

  end

  it "displays hospital's full address, the number of doctors it has, and the doctors universities" do
    visit "/hospitals/#{@sloan.id}"
    expect(page).to have_content(@sloan.name)
    expect(page).to have_content(@sloan.address)
    expect(page).to have_content(@sloan.city)
    expect(page).to have_content(@sloan.state)
    expect(page).to have_content(@sloan.zipcode)
    expect(page).to have_content("Number of Doctors: 3")
    expect(page).to have_content("Harvard University", count:1)
    expect(page).to have_content("University of Pennsylvania", count:1)
  end
end

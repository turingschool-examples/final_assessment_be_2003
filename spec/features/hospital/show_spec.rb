require 'rails_helper'

RSpec.describe "When I visit a hospital's show page" do
  before(:each) do
    @grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: 98101 )
    @seaside = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: 90001 )
    @merideth = @grey_sloan.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    @alex = @grey_sloan.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
    @miranda = @seaside.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
    @mcdreamy = @seaside.doctors.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")
    @mcdreamy_2 = @seaside.doctors.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")
    @katie_b = @merideth.patients.create(name: "Katie Bryce", age: 24)
    @denny_d = @alex.patients.create(name: "Denny Duquette", age: 39)

    @rebecca_p = @mcdreamy.patients.create(name: "Rebecca Pope", age: 32)
    @zola = @mcdreamy.patients.create(name: "Zola Shepherd", age: 2)
    @rico = @miranda.patients.create(name: "Rico Suave", age: 22)
    @mimi = @miranda.patients.create(name: "Mimi Mimison", age: 88)
  end

  it "I see the hospital's name,street address, city, state, and zip" do 

    visit "/hospitals/#{@seaside.id}"

    expect(page).to have_content(@seaside.name)
    expect(page).to have_content("Address: #{@seaside.address}")
    expect(page).to have_content("City: #{@seaside.city}")
    expect(page).to have_content("State: #{@seaside.state}")
    expect(page).to have_content("Zip: #{@seaside.zip}")
    expect(page).to_not have_content(@grey_sloan.name)
    expect(page).to_not have_content("Address: #{@grey_sloan.address}")
    expect(page).to_not have_content("City: #{@grey_sloan.city}")
    expect(page).to_not have_content("State: #{@grey_sloan.state}")
    expect(page).to_not have_content("Zip: #{@grey_sloan.zip}")
  end

  it "I see the number of doctors that work at this hospital" do 

    visit "/hospitals/#{@seaside.id}"

    expect(page).to have_content("Number of Doctors: 3")
  end

  it "I see a unique list of universities that this hospital's doctors attended" do 

    visit "/hospitals/#{@seaside.id}"

    expect(page).to have_content(@mcdreamy.education)
    expect(page).to have_content(@miranda.education)
  end

  it "I see a link to view all of that hospitals patients. Link goes to patients index for hospital" do 

    visit "/hospitals/#{@seaside.id}"

    click_link("View Patients")

    expect(current_path).to eq("/hospitals/#{@seaside.id}/patients")
    expect("Mimi Mimison").to appear_before("Rebecca Pope")
    expect("Rebecca Pope").to appear_before("Rico Suave")
    expect("Rico Suave").to appear_before("Zola Shepherd")

  end
end


# User Story 3, Hospital Patient Index Page
# As a visitor
# When I visit the hospitals show page 
# I see a link to view all of that hospitals patients 
# When I click that link
# I'm taken to a patients index page for that hospital 

# I see the names of all that hospital's patients listed from oldest to youngest

# User Story 2, Hospital Show Page
# "As a visitor
# When I visit a hospital's show page
# I see the hospital's name,street address, city, state, and zip

# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended
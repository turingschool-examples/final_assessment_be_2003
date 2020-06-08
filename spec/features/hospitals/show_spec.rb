require 'rails_helper'

RSpec.describe 'hospitals show page', type: :feature do
  before(:each) do
    @greys = Hospital.create(name:"Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "Washington", zip: "98101")

    @meredith = @greys.doctors.create(name: "Meredith Grey", specialty: "general surgery", school: "Turing")
    @joe = @greys.doctors.create(name: "Joe", specialty: "rashes", school: "Brown")
    @amy = @greys.doctors.create(name: "Amy", specialty: "eyeballs", school: "Turing")
    @kyle = @greys.doctors.create(name: "Kyle", specialty: "hearts", school: "Home Schooled")
  end

  it "shows doctor's information (name,specialty,school,hospital,patients)" do
    visit "/hospitals/#{@greys.id}"

    expect(page).to have_content(@greys.name)
    expect(page).to have_content(@greys.address)
    expect(page).to have_content(@greys.city)
    expect(page).to have_content(@greys.state)
    expect(page).to have_content(@greys.zip)

    expect(page).to have_content("Doctors on staff: 4")
    expect(page).to have_content("Educations: Turing, Brown, Home Schooled.")
  end
end

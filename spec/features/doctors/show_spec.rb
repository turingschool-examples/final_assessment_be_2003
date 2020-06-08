require 'rails_helper'

RSpec.describe 'doctors show page', type: :feature do
  before(:each) do
    @greys = Hospital.create(name:"Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "Washington", zip: "98101")

    @meredith = @greys.doctors.create(name: "Meredith Grey", specialty: "general surgery", school: "Turing")

    @mikal = @meredith.patients.create(name: "Mikal", age: 27)
    @austin = @meredith.patients.create(name: "Austin", age: 26)
    @jared = @meredith.patients.create(name: "Jared", age: 27)
  end

  it "shows doctor's information (name,specialty,school,hospital,patients)" do
    require "pry";binding.pry
    visit "/doctors/#{@meredith.id}"

    expect(page).to have_content(@meredith.name)
    expect(page).to have_content(@meredith.specialty)
    expect(page).to have_content(@meredith.school)

    expect(page).to have_content(@greys.name)

    expect(page).to have_content(@mikal.name)
    expect(page).to have_content(@austin.name)
    expect(page).to have_content(@jared.name)
  end
end

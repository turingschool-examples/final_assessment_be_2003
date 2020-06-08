require 'rails_helper'

RSpec.describe "Patient index page" do
  before(:each) do
    @greys = Hospital.create(name:"Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "Washington", zip: "98101")

    @meredith = @greys.doctors.create(name: "Meredith Grey", specialty: "general surgery", school: "Turing")
    @joe = @greys.doctors.create(name: "Joe", specialty: "rashes", school: "Brown")

    @mikal = @meredith.patients.create(name: "Mikal", age: 27)
    @austin = @meredith.patients.create(name: "Austin", age: 26)
    @jared = @joe.patients.create(name: "Jared", age: 25)
  end

  it "lists all patients from oldest to youngest" do
    visit "/hospitals/#{@greys.id}/patients"

    expect(page).to have_content("Mikal Austin Jared")
  end

end

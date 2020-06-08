require "rails_helper"

RSpec.describe "when visiting a hospitals show page" do
  before :each do
    @greys = Hospital.create!(name: "Grey Sloan Memorial Hospital",
    address: "123 Save Lives Rd",
    city: "Seattle",
    state: "WA",
    zip: 98101)


    @meredith = @greys.doctors.create!(name: "Meredith Grey",
                              specialty: "General Surgery",
                              education: "Harvard University")

    @alex = @greys.doctors.create!(name: "Alex Karev",
                              specialty: "Pediatric Surgery",
                              education: "Johns Hopkins University")

    @miranda = @greys.doctors.create!(name: "Miranda Bailey",
                              specialty: "General Surgery",
                              education: "Stanford University")

    @katie = @meredith.patients.create!(name: "Katie Bryce",
                                        age: 24)
    @denny = @alex.patients.create!(name: "Denny Duquette",
                                        age: 39)
    @rebecca = @miranda.patients.create!(name: "Rebecca Pope",
                                          age: 32)
  end

  it "a visitor sees the hospitals info, # of doctors, list of universities docs attended" do
    visit "/hospitals/#{@greys.id}"

    expect(page).to have_content(@greys.name)
    expect(page).to have_content(@greys.address)
    expect(page).to have_content(@greys.city)
    expect(page).to have_content(@greys.state)
    expect(page).to have_content(@greys.zip)

    expect(page).to have_content(@greys.number_of_doctors)
    expect(page).to have_content(@greys.doctors.first.education)
    expect(page).to have_content(@greys.doctors.last.education)
  end

  it "a visitor can click a link that will take them to patients index page" do
    visit "/hospitals/#{@greys.id}"

    click_link "View Patients"

    expect(current_path).to eq("/hospitals/#{@greys.id}/patients")
  end

  it "patients index will list names of patient from oldest to youngest" do
    visit "/hospitals/#{@greys.id}/patients"
    within(:css, "ol#patients") do
      expect(page.all('li')[0]).to have_content(@denny.name)
      expect(page.all('li')[1]).to have_content(@rebecca.name)
      expect(page.all('li')[2]).to have_content(@katie.name)
    end
  end

  it "a visitor can click a link that will take them to patients index page" do
    visit "/hospitals/#{@greys.id}"

    click_link "Add Doctor"

    expect(current_path).to eq("/hospitals/#{@greys.id}/doctors/new")
    expect(page).to have_content("New Doctor Hire for #{@greys.name}")
  end

  it "a visitor can click a link that will take them to patients index page" do
    visit "/hospitals/#{@greys.id}/doctors/new"

    fill_in :name, with: "Owen Hunt"
    fill_in :specialty, with: "Trauma Surgery"
    fill_in :education, with: "Turing"

    click_on "Submit"

    expect(current_path).to eq("/hospitals/#{@greys.id}")
    expect(@greys.number_of_doctors).to eq(4)
  end
end

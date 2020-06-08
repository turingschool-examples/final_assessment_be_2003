require 'rails_helper'

RSpec.describe "Dr Show Page" do
  before :each do
    @hospital1 = Hospital.create(name:"Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101" )
    @hospital2 = Hospital.create(name:"Seaside Health & Wellness Center", address:"123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001" )

    @doctor1 = @hospital1.doctors.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    @doctor2 = @hospital1.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")

    @patient1 = Patient.create(name: "Katie Bryce", age: 24)
    @patient2 = Patient.create(name: "Denny Duquette", age: 39)
    @patient3 = Patient.create(name: "Rebecca Pope", age: 32)
    @patient4 = Patient.create(name: "Zola  Shepherd", age: 2)

    @doctor1.patients << @patient1
    @doctor1.patients << @patient2
    @doctor1.patients << @patient3
    @doctor2.patients << @patient4

  end
  it "US1 Doctor show page has info about doctors, patients and its hospital" do
    visit doctor_path(@doctor1)

    within("#doctor-info")do
      expect(page).to have_content("Name: #{@doctor1.name}")
      expect(page).to have_content("Specialty: #{@doctor1.specialty}")
      expect(page).to have_content("Education: #{@doctor1.education}")
      expect(page).to_not have_content("Name: #{@doctor2.name}")
      expect(page).to_not have_content("Specialty: #{@doctor2.specialty}")
      expect(page).to_not have_content("Education: #{@doctor2.education}")
    end

    within("#doctor-hospital")do
      expect(page).to have_content("Works at: #{@hospital1.name}")
      expect(page).to_not have_content(@hospital2.name)
    end

    expect(page).to have_content("Patients:")
    within("#patient-#{@patient1.id}")do
      expect(page).to have_content(@patient1.name)
      expect(page).to_not have_content(@patient2.name)
    end
    within("#patient-#{@patient2.id}")do
      expect(page).to have_content(@patient2.name)
      expect(page).to_not have_content(@patient3.name)
    end
    within("#patient-#{@patient3.id}")do
      expect(page).to have_content(@patient3.name)
    end
    expect(page).to_not have_content(@patient4.name)
  end

  it "US5 Remove a patient from a doctors caseload via link on doctor show page" do
    visit doctor_path(@doctor1)

    within("#patient-#{@patient1.id}")do
      expect(page).to have_link("Remove Patient From #{@doctor1.name}'s Caseload")
    end
    within("#patient-#{@patient2.id}")do
      expect(page).to have_link("Remove Patient From #{@doctor1.name}'s Caseload")
    end
    within("#patient-#{@patient3.id}")do
      click_link("Remove Patient From #{@doctor1.name}'s Caseload")
    end
    expect(current_path).to eq(doctor_path(@doctor1))
    expect(page).to_not have_content(@patient3.name)
  end

  it "US6 HAPPY: Reassign Dr to different hospital via link on doctor show page" do
    visit doctor_path(@doctor1)

    within("#doctor-hospital")do
      expect(page).to have_content("Works at: #{@hospital1.name}")
      expect(page).to_not have_content(@hospital2.name)
      click_link("Assign #{@doctor1.name} to a Different Hospital")
    end

    expect(current_path).to eq(edit_doctor_path(@doctor1))
    expect(page).to have_content("Current Hospital ID: #{@hospital1.id}")

    within("#assign-form")do
      # fill_in "doctor[hospital_id]",	with: @hospital2.id 
      select @hospital2.id, :from => "doctor[hospital_id]"

      click_on "Add #{@doctor1.name} to this hospital"
    end
    
    expect(current_path).to eq(doctor_path(@doctor1))
    within("#doctor-hospital")do
      expect(page).to have_content("Works at: #{@hospital2.name}")
      expect(page).to_not have_content(@hospital1.name)
      expect(page).to have_link("Assign #{@doctor1.name} to a Different Hospital")
    end

  end

    it "US6 SAD: If no selection, default is to assign to hospital with lowest id" do
    visit doctor_path(@doctor1)

    within("#doctor-hospital")do
      expect(page).to have_content("Works at: #{@hospital1.name}")
      expect(page).to_not have_content(@hospital2.name)
      click_link("Assign #{@doctor1.name} to a Different Hospital")
    end

    expect(current_path).to eq(edit_doctor_path(@doctor1))
    expect(page).to have_content("Current Hospital ID: #{@hospital1.id}")

    within("#assign-form")do

      click_on "Add #{@doctor1.name} to this hospital"
    end
    
    expect(current_path).to eq(doctor_path(@doctor1))
    hospital = Hospital.first
    within("#doctor-hospital")do
      expect(page).to have_content("Works at: #{hospital.name}")
      expect(page).to have_link("Assign #{@doctor1.name} to a Different Hospital")
    end

  end
  
  
  
end

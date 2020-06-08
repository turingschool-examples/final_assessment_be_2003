# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Hospitals:

hospital = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
psych = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

# Doctors:

grey = hospital.doctors.create(name: "Meredith Grey", speciality: "General Surgery", education: "Harvard University")
karev = hospital.doctors.create(name: "Alex Karev", speciality: "Pediatric Surgery", education: "Johns Hopkins University")
bailey = hospital.doctors.create(name: "Miranda Bailey", speciality: "General Surgery", education: "Stanford University")
shepherd = hospital.doctors.create(name: "Derek McDreamy Shepherd", speciality: "Attending Surgeon", education: "University of Pennsylvania")

# Patients:

katie = Patient.create(name: "Katie Bryce", age: 24)
denny = Patient.create(name: "Denny Duquette", age: 39)
rebecca = Patient.create(name: "Rebecca Pope", age: 32)
zola = Patient.create(name: "Zola  Shepherd", age: 2)

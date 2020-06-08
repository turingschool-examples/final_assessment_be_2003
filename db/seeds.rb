# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@meredith = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
@alex = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
@miranda = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
@derek = Doctor.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")

@sloan = Hospital.create(name: "Grey Sloan Memorial Hospital", address:"123 Save Lives Rd", city: "Seattle", state: "WA", zipcode: "98101")
@seaside = Hospital.create(name:"Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zipcode: "90001")

@katie = Patient.create(name: "Katie Bryce", age: 24)
@denny = Patient.create(name: "Denny Duquette", age: 39)
@rebecca = Patient.create(name: "Rebecca Pope", age: 32)
@zola = Patient.create(name: "Zola  Shepherd", age: 2)

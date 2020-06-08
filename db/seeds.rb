# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


hospital = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: 98101})
meredith = Doctor.create({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: "#{hospital.id}"})
alex = Doctor.create({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: "#{hospital.id}"})
katie = Patient.create({name: "Katie Bryce", age: 24})
denny = Patient.create({name: "Denny Duquette", age: 39})
rebecca = Patient.create({name: "Rebecca Pope", age: 32})
zola = Patient.create({name: "Zola  Shepherd", age: 2})
meredith.patients << rebecca
meredith.patients << katie
meredith.patients << denny

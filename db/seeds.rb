# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


grey = Hospital.create(name:"Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
seaside = Hospital.create(name:"Seaside Health & Wellness Center", address: "123 Private Practice Rd", city: "Seattle", state: "WA", zip: "98101")
     
meredith = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: grey.id)
alex = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Stanford University", hospital_id: grey.id)

denny = Patient.create(name: "Denny Duquette", age: 39)
rebecca = Patient.create(name: "Rebecca Pope", age: 32)
katie = Patient.create(name: "Katie Bryce", age: 24)
zola = Patient.create(name: "Zola Shepherd", age: 2)

DoctorPatient.create(doctor: meredith, patient: zola)
DoctorPatient.create(doctor: meredith, patient: denny)
DoctorPatient.create(doctor: alex, patient: rebecca)
DoctorPatient.create(doctor: alex, patient: katie)
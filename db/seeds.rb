# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

#hospitals
memorial = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
seaside = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

#doctors
grey = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", eduction: "Harvard University", hospital_id: memorial.id)
karev = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: memorial.id)
yang = Doctor.create(name: "Cristina Yang", specialty: "Cardiothoracic Surgery", education: "Stanford University", hospital_id: memorial.id)
shepherd = Doctor.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: memorial.id)
sloan = Doctor.create(name: "Mark McSteamy Sloan", specialty: "Plastic Surgery", education: "University of Pennsylvania", hospital_id: memorial.id)
bailey = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: memorial.id)
avery = Doctor.create(name: "Jackson Avery", specialty: "Plastic Surgery", education: "Boston University", hospital_id: seaside.id)

#Patients
bryce = Patient.create(name: "Katie Bryce", age: 24)
duqette = Patient.create(name: "Denny Duquette", age: 39)
zola = Patient.create(name: "Zola Shepherd", age: 2)
pope = Patient.create(name: "Rebecca Pope", age: 32)

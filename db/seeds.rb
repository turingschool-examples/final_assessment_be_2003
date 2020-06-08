# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Hospitals:
grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101" )
seaside_health = Hospital.create(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

# Doctors:
grey = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: grey_sloan.id)
karev = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: seaside_health.id)
bailey = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: seaside_health.id)
shepherd = Doctor.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: grey_sloan.id)


# Patients: 
katie = Patient.create(name: "Katie Bryce", age: 24)
denny = Patient.create(name: "Denny Duquette", age: 39)
rebecca = Patient.create(name: "Rebecca Pope", age: 32)
zola = Patient.create(name: "Zola Shepherd", age: 2)

PatientDoctor.create(doctor_id: grey.id, patient_id: katie.id)
PatientDoctor.create(doctor_id: shepherd.id, patient_id: katie.id)
PatientDoctor.create(doctor_id: karev.id, patient_id: denny.id)
PatientDoctor.create(doctor_id: bailey.id, patient_id: denny.id)
PatientDoctor.create(doctor_id: karev.id, patient_id: rebecca.id)
PatientDoctor.create(doctor_id: bailey.id, patient_id: rebecca.id)
PatientDoctor.create(doctor_id: grey.id, patient_id: zola.id)
PatientDoctor.create(doctor_id: karev.id, patient_id: zola.id)

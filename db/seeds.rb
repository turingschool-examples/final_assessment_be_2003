# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
hospital_1 = Hospital.create({name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101"})
hospital_2 = Hospital.create({name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001"})


doctor_1 = Doctor.create({ name: 'Meredith Grey', specialty: "General Surgery", education: "Harvard University", hospital_id: hospital_1.id})
doctor_2 = Doctor.create({ name: 'Alex Karev', specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: hospital_1.id})
doctor_3 = Doctor.create({ name: 'Miranda Bailey', specialty: "General Surgery", education: "Stanford University", hospital_id: hospital_2.id})
doctor_4 = Doctor.create({ name: 'erek McDreamy Shepherd', specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: hospital_2.id})

patient_1 = Patient.create({name: "Katie Bryce", age: 24})
patient_2 = Patient.create({name: "Denny Duquette", age: 39})
patient_3 = Patient.create({name: "Rebecca Pope", age: 32})
patient_4 = Patient.create({name: "Zola Shepherd", age: 2})

DoctorPatient.create({doctor_id: doctor_1.id, patient_id: patient_1.id})
DoctorPatient.create({doctor_id: doctor_1.id, patient_id: patient_2.id})
DoctorPatient.create({doctor_id: doctor_2.id, patient_id: patient_2.id})
DoctorPatient.create({doctor_id: doctor_3.id, patient_id: patient_3.id})
DoctorPatient.create({doctor_id: doctor_4.id, patient_id: patient_4.id})
DoctorPatient.create({doctor_id: doctor_3.id, patient_id: patient_4.id})

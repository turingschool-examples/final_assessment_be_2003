# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


hospital1 = Hospital.create(name: "Banner Desert", address: "123 Medical Dr", city: "Mesa", state: "AZ", zip: "80202")
hospital2 = Hospital.create(name: "Skyline", address: "555 Cactus St", city: "Scottsdale", state: "AZ", zip: "85048")

doc1 = hospital1.doctors.create(name: "John Matrix", specialty: "Cardiology", education: "Arizona State University")
doc2 = hospital1.doctors.create(name: "Doug Quiad", specialty: "Neurology", education: "Metro State University")
doc3 = hospital1.doctors.create(name: "Harry Tasker", specialty: "Pulmonology", education: "University of Florida")

pat1 = Patient.create(name: "Little Timmy", age: 10)
pat2 = Patient.create(name: "Ice T", age: 60)
pat3 = Patient.create(name: "Tron", age: 30)

dp1 = DoctorPatient.create(doctor_id: doc1.id, paitent_id: pat1.id)
dp1 = DoctorPatient.create(doctor_id: doc1.id, paitent_id: pat2.id)
dp1 = DoctorPatient.create(doctor_id: doc1.id, paitent_id: pat3.id)
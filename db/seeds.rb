# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@sloan = Hospital.create!(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101")
@seaside = Hospital.create!(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")

@grey = @sloan.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
@karev = @sloan.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
@bailey = @sloan.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
@shepherd = @seaside.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")

@bryce = Patient.create!(name: "Katie Bryce", age: 24)
@duquette = Patient.create!(name: "Denny Duquette", age: 39)
@pope = Patient.create!(name: "Rebecca Pope", age: 32)
@zola = Patient.create!(name: "Zola Shepherd", age: 2)

DoctorPatient.create!(doctor: @grey, patient: @bryce)
DoctorPatient.create!(doctor: @grey, patient: @duquette)
DoctorPatient.create!(doctor: @karev, patient: @duquette)
DoctorPatient.create!(doctor: @bailey, patient: @pope)
DoctorPatient.create!(doctor: @shepherd, patient: @zola)

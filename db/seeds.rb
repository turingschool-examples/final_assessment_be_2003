# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Hospitals:

grey_sloan = Hospital.create(
  name: "Grey Sloan Memorial Hospital",
  address: "123 Save Lives Rd",
  city: "Seattle",
  state: "WA",
  zip: 98101
)

seaside = Hospital.create(
  name: "Seaside Health & Wellness Center",
  address: "123 Private Practice Road",
  city: "Los Angeles",
  state: "CA",
  zip: 90001
)

# Doctors:
Doctor.create(
  name: "Meredith Grey",
  specialty: "General Surgery",
  university: "Harvard University",
  hospital_id: grey_sloan.id
)

Doctor.create(
  name: "Alex Karev",
  specialty: "Pediatric Surgery",
  university: "Johns Hopkins University",
  hospital_id: grey_sloan.id
)

Doctor.create(
  name: "Miranda Bailey",
  specialty: "General Surgery",
  university: "Stanford University",
  hospital_id: seaside.id
)

Doctor.create(
  name: "Derek McDreamy Shepherd",
  specialty: "Attending Surgeon",
  university: "University of Pennsylvania",
  hospital_id: seaside.id
)

# Patients:

Patient.create(
  name: "Katie Bryce",
  age: 24
)

Patient.create(
  name: "Denny Duquette",
  age: 39
)

Patient.create(
  name: "Rebecca Pope",
  age: 32
)

Patient.create(
  name: "Zola  Shepherd",
  age: 2
)

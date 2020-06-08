# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
greys = Hospital.create(name:"Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "Washington", zip: "98101")
seaside = Hospital.create(name:"Seaside Health & Wellness Center", address: "123 Private Practice Rd", city: "LA", state: "California", zip: "90210")

meredith = greys.doctors.create(name: "Meredith Grey", specialty: "general surgery", school: "Turing")
joe = greys.doctors.create(name: "Joe", specialty: "rashes", school: "Brown")
amy = seaside.doctors.create(name: "Amy", specialty: "eyeballs", school: "Home Schooled")

mikal = meredith.patients.create(name: "Mikal", age: 27)
austin = meredith.patients.create(name: "Austin", age: 26)
jared = meredith.patients.create(name: "Jared", age: 27)
greg = joe.patients.create(name: "Greg", age: 28)
kujo = amy.patients.create(name: "Kujo", age: 25)

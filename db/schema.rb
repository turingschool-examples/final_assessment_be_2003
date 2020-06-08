# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

end

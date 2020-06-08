# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Doctors:
  # Name: Meredith Grey
  # Specialty: General Surgery
  # Education: Harvard University
  # Name: Alex Karev
  # Specialty: Pediatric Surgery
  # Education: Johns Hopkins University
  # Name: Miranda Bailey
  # Specialty: General Surgery
  # Education: Stanford University
  # Name: Derek McDreamy Shepherd
  # Specialty: Attending Surgeon
  # Education: University of Pennsylvania
# Hospitals:
  # Grey Sloan Memorial Hospital
  # 123 Save Lives Rd
  # Seattle, WA 98101
  # Seaside Health & Wellness Center
  # 123 Private Practice Road
  # Los Angeles, CA 90001
# Patients:
  # Name: Katie Bryce
  # Age: 24
  # Name: Denny Duquette
  # Age: 39
  # Name: Rebecca Pope
  # Age: 32
  # Name: Zola  Shepherd
  # Age: 2



  hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital", address: "123 Save Lives Rd", city: "Seattle", state: "WA", zip: "98101" )
  hospital_2 = Hospital.create!(name: "Seaside Health & Wellness Center", address: "123 Private Practice Road", city: "Los Angeles", state: "CA", zip: "90001")
  doc_1 = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: hospital_1.id)
  doc_2 = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: hospital_1.id)
  doc_3 = Doctor.create!(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: hospital_2.id)
  doc_4 = Doctor.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: hospital_2.id)
  doc_5 = Doctor.create!(name: "Doctor Phill", specialty: "Attending Surgeon", education: "Harvard University", hospital_id: hospital_1.id)
  patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
  patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
  patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
  patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)

  PatientDoctor.create!(doctor_id: doc_1.id, patient_id: patient_1.id)
  PatientDoctor.create!(doctor_id: doc_1.id, patient_id: patient_2.id)
  PatientDoctor.create!(doctor_id: doc_1.id, patient_id: patient_3.id)
  PatientDoctor.create!(doctor_id: doc_2.id, patient_id: patient_1.id)
  PatientDoctor.create!(doctor_id: doc_2.id, patient_id: patient_3.id)

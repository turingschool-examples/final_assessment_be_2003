# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Doctors:
Doctor.create(
Name: 'Meredith Grey',
Specialty: 'General Surgery',
Education: 'Harvard University')

Doctor.create(
Name: 'Alex Karev',
Specialty: 'Pediatric Surgery',
Education: 'Johns Hopkins University')

Doctor.create(
Name: 'Miranda Bailey',
Specialty: 'General Surgery',
Education: 'Stanford University')

Doctor.create(
Name: 'Derek McDreamy Shepherd',
Specialty: 'Attending Surgeon',
Education: 'University of Pennsylvania')


# Hospitals:

Hospital.create(
name: 'Grey Sloan Memorial Hospital',
address: '123 Save Lives Rd',
city: 'Seattle',
state: 'WA',
zip: 98101)

Hospital.create(
name: 'Seaside Health & Wellness Center',
address: '123 Private Practice Road',
city: 'Los Angeles',
state: 'CA,'
zip: 90001)

# Patients:
Patient.create(
Name: 'Katie Bryce',
Age: 24)

Patient.create(
Name: 'Denny Duquette',
Age: 39)

Patient.create(
Name: 'Rebecca Pope',
Age: 32)

Patient.create(
Name: 'Zola  Shepherd',
Age: 2)

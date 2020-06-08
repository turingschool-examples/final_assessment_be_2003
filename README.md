# BEM2 Final Technical Assessment
## Description

Seattle Grace is based off of Grey's Anatomy (Mike's favorite show), but you need NO knowledge of Grey's Anatomy to complete this final.
Hospitals have many Doctors, Doctors work for just one hospital. Doctors can have many patients, and patients can have many doctors. Make sure to add timestamps to your tables.

## Instructions
* Work on this assessment independently. DO NOT discuss with anyone.
* Fork this repository
* Clone your fork
* Run `bundle install`
* Run `rake db:create`
* Complete the tasks below
* Push your code to you' fork once the time is up (not before!"

## User Stories

```
User Story 5, Remove a Patient from a Doctor
As a visitor
When I visit a Doctor's show page
Next to each patient's name, I see a button to remove that patient from that doctor's caseload
When I click that button for one patient
I'm brought back to the Doctor's show page
And I no longer see that patient's name listed
```
```
User Story 6, Reassign Doctor to Different Hospital
As a visitor
When I visit a doctor's show page
Next to the name of the hospital where this doctor works
I see a link that says "Assign <insert name of doctor> to a Different Hospital"
When I click on that link
I'm taken to a form where I can input an id of an existing hospital
When I click "Add <insert name of doctor> to this hospital"
I'm taken back to that doctor's show page
And I can see the name of the new hospital that they were assigned to
```

### Setup
- Fork this repository
- Clone down your forked repository
- Perform the usual setup steps after cloning a Rails application:
    - `bundle install`
    - `rake db:create`

When you run `bundle exec rspec` , you should have 0 tests.

### Seed Data

## Doctors:

Name: Meredith Grey
Specialty: General Surgery
Education: Harvard University

Name: Alex Karev
Specialty: Pediatric Surgery
Education: Johns Hopkins University

Name: Miranda Bailey
Specialty: General Surgery
Education: Stanford University

Name: Derek McDreamy Shepherd
Specialty: Attending Surgeon
Education: University of Pennsylvania

## Hospitals:

Grey Sloan Memorial Hospital
123 Save Lives Rd
Seattle, WA 98101

Seaside Health & Wellness Center
123 Private Practice Road
Los Angeles, CA 90001

## Patients:

Name: Katie Bryce
Age: 24

Name: Denny Duquette
Age: 39

Name: Rebecca Pope
Age: 32

Name: Zola  Shepherd
Age: 2

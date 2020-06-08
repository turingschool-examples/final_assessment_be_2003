## 2003 BE2 Final Assessment
Please follow the setup directions below. Stories for the assessment will be sent out at 9am on Monday.

### Setup
- Fork this repository
- Clone down your forked repository
- Perform the usual setup steps after cloning a Rails application:
    - `bundle install`
    - `rake db:create`

When you run `bundle exec rspec` , you should have 0 tests.

# BEM2 Final Technical Assessment
## Description
Seattle Grace is based off of Grey's Anatomy (Mike's favorite show), but you need NO knowledge of Grey's Anatomy to complete this final.
Hospitals have many Doctors, Doctors work for just one hospital. Doctors can have many patients, and patients can have many doctors. Make sure to add timestamps to your tables.
'## Instructions
'* Work on this assessment independently. DO NOT discuss with anyone.
* Fork this repository
* Clone your fork
* Run `bundle install`
* Run `rake db:create`
* Complete the tasks below
* Push your code to you' fork once the time is up (not before!"


  - Hospitals have many doctors, and doctors work for only one hospital. (One to many)
  - Doctors have many patients, and patients can have many doctors. (many to many)
"## User Stories
'```
User Story 1, Doctors Show Page
'As a visitor
When I visit a doctor's show page
I see all of that doctor's information including:
 - name
 - specialty
 - university where they got their doctorate
And I see the name of the hospital where this doctor works
And I see the names of all of the patients this doctor has
```
""```
User Story 2, Hospital Show Page
"As a visitor
When I visit a hospital's show page
I see the hospital's name, street address, city, state, and zip
And I see the number of doctors that work at this hospital
And I see a unique list of universities that this hospital's doctors attended
```
```
User Story 3, Hospital Patient Index Page
As a visitor
When I visit the hospitals show page
I see a link to view all of that hospitals patients
When I click that link
I'm taken to a patients index page for that hospital
I see the names of all that hospital's patients listed from oldest to youngest
```
```
User Story 4, Creating a Doctor
As a visitor
When I visit a hospital's show page
I see a link to add a doctor for this hospital
When I click that link
I'm taken to a page that has a title of "New Doctor Hire for <insert hospital name here>"
And on that page there's a form for me to enter a new doctor's name, specialty, and university where they got their doctorate.
When I fill out all three fields and click submit
I am taken back to the hospital show page
And I can see that the number of doctors has increased by one
```
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

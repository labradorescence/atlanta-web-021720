# Rails Many-to-Many Associations 
We're going to dive right in, continuing our exploration of Rails by creating an app from scratch that handles a many-to-many association. 


## Goals 
- To form a many-to-many association between two models and see that associations in action. 
- To address as many deliverables as we can using a process.


## Deliverables to Build On

We're building a database for Doctor Who fans, to know which Doctor a companion has traveled with.

To start, we'll need to build two models: 

- Doctor
    - Attributes: 
        - name
        - nickname

- Companion
    - Attributes: 
        - name
        - description

And the associated index route to see all Doctors and Companions in our database.


### Requirements 

- DoctorCompanion association
    - Create the association between the models. Update the schema and models to create the DoctorCompanion association.

    - A DoctorCompanion should have a:
        - a Doctor
        - a companion

    - Each Doctor can have multiple companions. Companions can belong to multiple Doctors.


- Doctor index page links
    - On the Doctor index page, a Doctor's name should link to that Doctor's show page.


- Doctor show page
    - Each Doctor show page should include the:
        - name 
        - nickname


- Companion show page
    - Companion show page should include the:
        - name
        - description


- Doctor Create page
    - Show a form to create a new Doctor. It should have:
        - an input for name
        - an input for nickname
        - a select dropdown to choose a companion
        - a submit button to create the Doctor

    - After successfully creating a Doctor, the user should be redirected to the new Doctor's show page.


- Doctor Validations
    - Add validations to the Doctor model:
        - must have a name
        - must have a nickname
    - Add error handling to the create action. If a user tries to create an invalid Doctor, the user should see the validation errors.


## Our Process 
Here again is the process we're going to follow to tackle as many deliverables as we can: 

    - Write out Schema

    - Create Models 

    - Create/Run Migration 

    - Check Schema and test

    - Create Association/Join Model 

    - Write out seed data and test association/join model

    - Create Controller Actions and update Routes

    - Create Associated Views and test 

    - Create Validations and test
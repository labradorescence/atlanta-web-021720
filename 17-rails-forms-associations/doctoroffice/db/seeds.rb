# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Doctor.destroy_all
Patient.destroy_all

10.times do
    Doctor.create(
        name: Faker::Name.unique.name, 
        specialty: Faker::Superhero.power
    )
end

p "Created #{Doctor.count} doctors."

sleep 2

10.times do 
    Patient.create(
        name: Faker::Name.unique.name,
        condition: Faker::Kpop.boy_bands, 
        doctor_id: Doctor.all.sample.id
    )
end

p "Created #{Patient.count} patients."

p "Done seeding database!"

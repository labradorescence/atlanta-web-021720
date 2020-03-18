# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Owner.destroy_all
Pet.destroy_all

10.times do
    Owner.create(name: Faker::Name.first_name , age: Faker::Number.number(digits: 2)) 
end 

p "added owners...creating pets!"

10.times do
    Pet.create(name: Faker::Name.first_name, breed: Faker::DcComics.hero, owner_id: Owner.all.sample.id)
end

p "added pets, done seeding!"

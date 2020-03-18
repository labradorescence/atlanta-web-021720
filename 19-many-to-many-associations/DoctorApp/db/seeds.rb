# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Doctor.destroy_all 
Companion.destroy_all
DoctorCompanion.destroy_all


10.times do 
    Doctor.create(name: Faker::TvShows::DrWho.the_doctor, nickname: Faker::FunnyName.name )
end

p "added doctors...moving on..."

10.times do 
    Companion.create(name: Faker::FunnyName.name, description: Faker::Lorem.sentence(word_count: 3) )
end

p "added companions...moving on..."

10.times do 
   DoctorCompanion.create(doctor_id: Doctor.all.sample.id, companion_id: Companion.all.sample.id) 
end

p "added all...get started testing!"
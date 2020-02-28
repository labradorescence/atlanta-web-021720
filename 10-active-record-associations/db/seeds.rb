

Passenger.destroy_all
Subway.destroy_all
Ride.destroy_all

p "Cleared the db."

puts "Creating Passengers"
10.times do
    Passenger.create(name: Faker::Name.name, age: Faker::Number.between(1, 60), gender: Faker::Gender.type)
end
puts "Passengers created!"

puts "Creating Subways"
10.times do
    Subway.create(line: Faker::Color.color_name, capacity: Faker::Number.between(1, 1000), status: 'Delayed', local_or_express: ['Local', 'Express'].sample)
end
puts "Subways created!"

puts "Creating Rides"
10.times do
  Ride.create(subway_id: Subway.all.sample.id, passenger_id: Passenger.all.sample.id)
end
puts "Rides created!"

## AFTER LECTURE NOTE- Using this seed data and the association formed, you can test: 
# p1 = Passenger.second
# s1 = Subway.last
# r1 = Ride.create(subway_id: 20, passenger_id: 22) (or at whatever ID's you get here)
# p1.rides, p1.subways, r1.subway, r1.ride, s1.passengers, s1.rides (look ma, no methods!)
# You can even try more complex asks like s1.passengers[0].name or p1.subways[0].line 
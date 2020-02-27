require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

venue_one_object = Venue.new("fox", "ATL")
venue_two_object = Venue.new("masqerade", "HOUSTON")
venue_three_object = Venue.new("tabernacle", "NYC")

b1 = Band.new("the_shakes", "Baltimore")
b2 = Band.new("jive_crew", "Bama")
b3 = Band.new("sundown", "DC")

c1 = Concert.new("tuesday", b1, venue_one_object)
c1 = Concert.new("Friday", b2, venue_one_object)
c1 = Concert.new("Sunday", b3, venue_one_object)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

require 'pry'

class Venue
    attr_accessor :title
    attr_reader :city
    @@all = []

    def initialize(title, city)
        @title = title
        @city = city
        @@all << self
    end

    def self.all
        @@all 
    end

    def concerts 
        # self == Instance of Venue 
        # drum_sets = []
        Concert.all.select do |concert|
            concert.venue == self 
        end
    end

    def bands 
        concerts.map do |concert_instance|
            binding.pry 
            concert_instance.band 
        end
    end
end
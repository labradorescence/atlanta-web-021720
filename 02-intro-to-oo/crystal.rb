require 'pry'

# Lyn is a big fan of collecting, sorting, 
# and using crystals. 
#
# We're going to create a class that allows Lyn 
# to create and give attributes to new crystals. 

# Deliverables
# -------------
#
# 1. Create a set of crystals that each have 
# a healing property, color, and rarity. 
#
# 2. Refactor using attr_ macros. 

class Crystal

attr_accessor :property, :color, :rarity

    def initialize(property, color, rarity)
        @property = property
        @color = color
        @rarity = rarity
    end
end

ruby = Crystal.new("healing", "red", "common")
amethyst = Crystal.new("mental acuity", "purple", "uncommon")
lepidolite = Crystal.new("stress relief", "burgundy", "rare")

binding.pry
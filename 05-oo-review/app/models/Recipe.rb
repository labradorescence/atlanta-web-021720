class Recipe 
  attr_accessor :title

  @@all = []

  def initialize(title)
    @title = title 
    @@all << self 
  end

  def self.all 
    @@all 
  end

  def self.most_popular 
    hash = {} 
    RecipeCard.all.each do |recipe_card|
      hash[recipe_card.recipe] ||= 0 
      hash[recipe_card.recipe] += 1 
    end

    # {"grandmas-cornbread" => 3, "cornbread" => 2}
    popularity_array = hash.sort_by do |recipe, count| 
      count <=> count 
    end

    recipe = popularity_array[0][0]
  end

end
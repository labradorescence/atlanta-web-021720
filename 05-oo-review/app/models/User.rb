class User 
  attr_accessor :first_name, :last_name 

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name 
    @last_name = last_name 
    @@all << self 
  end

  def self.all
    # self == User class
    @@all  
  end 

  def recipe_cards 
    recipe_cards = RecipeCard.all.select do |recipe_card|
      recipe_card.user == self 
    end
  end

  def recipes 
    return recipe_cards.map do |recipe_card|
      recipe_card.recipe 
    end
  end 

  def add_recipe_card(recipe, date, rating)
    # self == Instance of User
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergy(ingredient)
    Allergy.new(self, ingredient)
  end

  def allergens 
    Allergy.all.select do |allergy|
      allergy.user == self 
    end
  end

  def top_three_recipes 
    sorted = recipe_cards.sort do |a, b|
      b.rating <=> a.rating 
    end

    sorted[0,2]
  end
end
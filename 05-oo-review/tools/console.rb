require_relative '../config/environment.rb'

# Recipes
recipe_one = Recipe.new("rice_casserole")
recipe_two = Recipe.new("hot_dog")
recipe_three = Recipe.new("beans")

# Users
user_one = User.new("sam", "thomas")

# Ingredients 
beans = Ingredient.new("beans")  

# Allergies 
peanut = Allergy.new(user_one, beans)


binding.pry

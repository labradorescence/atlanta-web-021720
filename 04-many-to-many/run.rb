require 'pry'
require 'faker'

require_relative "./ingredient"
require_relative "./recipe"
require_relative "./recipeingredient"

puts "Creating seed data... one moment please."

5.times do
    Ingredient.new(Faker::Food.ingredient, Faker::Food.measurement)
end

puts "I've finished adding ingredients. Adding recipes... one moment please."

5.times do
    Recipe.new(Faker::Food.dish, Faker::Food.description)
end

puts "Cool, all done. Now I'll add some recipe ingredients... one moment please. "

tasty = RecipeIngredient.new(Recipe.all[1], Ingredient.all[4])
yummy = RecipeIngredient.new(Recipe.all[2], Ingredient.all[3])
delish = RecipeIngredient.new(Recipe.all[0], Ingredient.all[2])
amaze = RecipeIngredient.new(Recipe.all[3], Ingredient.all[1])


puts "All done! Your program has been seeded."
binding.pry
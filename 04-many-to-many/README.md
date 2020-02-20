# Ruby Many-to-Many Relationships
Earlier, we talked about how data can work together to form and express relationships. Now, we'll explore a different type of relationship- many-to-many.

## SWBATs
- Implement both sides of a many to many relationship
- Practice keeping groups of data related to classes on the class as a class variable
- Demonstrate single source of truth by not storing collections of objects on other objects
- Demonstrate single source of truth by not storing one object in multiple collections


## Digging into Many-to-Many Relationships
A many-to-many relationship describes a relationship between two models where one model `has many` of the other, and vice versa.


### What are some examples of many-to-many relationships? 
- Students and Teachers
- Recipes and Ingredients
- Products and Stores
- Libraries and Books
- Planes and Airports
- Consoles and Games

### Which relationship will we select to build out? 

=> Recipes and Ingredients


*Check out our code to see how we have built this many-to-many relationship.*


### Many-to-Many in Action

A many-to-many relationship was built using the following process: 

- Identify the domain problem and real-life application 
- Draw out a schema (more on this word later) to represent your models
- Create your models with the attributes and data needed to have basic functionality
- TEST and get errors
- Let errors inform you of what logic needs to be added next
- Pseudocode out your logic 
- Write code you think will work, test, get errors, and edit code
- Refactor and make your code efficient


Our mission is to understand where the relationship between these two models happens and what we can do with this type of relationship by assessing where the relationship was made, and what instance methods were used to gain additional information. 

Here are some test cases (run `ruby run.rb` and test these in the console): 

See if seed data is present: 
- Recipe.all
- Ingredient.all
- RecipeIngredient.all

Create new instances: 
- r = Recipe.all[1]
- i = Ingredient.all[3]

See if many-to-many relationship is valid: 
- r.ingredients
- i.recipes
- r.recipe_ingredients
- i.recipe_ingredients

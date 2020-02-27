# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

results = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
results_parsed = JSON.parse(results)
p results_parsed

results_parsed['drinks'].each do |result|
  Ingredient.create(name: result["strIngredient1"])
end

Cocktail.create(name: "Gin Tonic")
Cocktail.create(name: "Whiskey Sour")
Cocktail.create(name: "Espresso Martini")
Cocktail.create(name: "Moscow Mule")
Cocktail.create(name: "Pina Colada")

Dose.create(description: "6 ml", cocktail: Cocktail.all.sample, ingredient: Ingredient.all.sample)
Dose.create(description: "1 table spoon", cocktail: Cocktail.all.sample, ingredient: Ingredient.all.sample)
Dose.create(description: "1 dl", cocktail: Cocktail.all.sample, ingredient: Ingredient.all.sample)
Dose.create(description: "2 cups", cocktail: Cocktail.all.sample, ingredient: Ingredient.all.sample)
Dose.create(description: "1 ounce", cocktail: Cocktail.all.sample, ingredient: Ingredient.all.sample)

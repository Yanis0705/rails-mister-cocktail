require 'open-uri'
require 'JSON'

Ingredient.destroy_all

puts "cleared"

puts "created ingredients"
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json = open(url).read
objs = JSON.parse(json)

objs["drinks"].each do |item|
  ingredient = item["strIngredient1"]
  Ingredient.create!(
    name: ingredient
  )
end

puts "Finished!"

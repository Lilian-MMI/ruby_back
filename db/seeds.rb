# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'
  ActiveRecord::Base.connection.execute("TRUNCATE #{table} RESTART IDENTITY;")
end

if Ingredient.count == 0
    path = File.join(File.dirname(__FILE__), "./data/ListIngredients.json")
    records = JSON.parse(File.read(path))
    records.each do |record|
        Ingredient.create!(record)
    end
    puts "Ingredient are seeded"
end

if Recipe.count == 0
    path = File.join(File.dirname(__FILE__), "./data/ListRecipes.json")
    records = JSON.parse(File.read(path))
    records.each do |record|
        Recipe.create!(record)
    end
    puts "Recipes are seeded"
end

if RecipeIngredient.count == 0
    path = File.join(File.dirname(__FILE__), "./data/ListRecipeIngredients.json")
    records = JSON.parse(File.read(path))
    records.each do |record|
        RecipeIngredient.create!(record)
    end
    puts "RecipeIngredients are seeded"
end


if Step.count == 0
    path = File.join(File.dirname(__FILE__), "./data/ListSteps.json")
    records = JSON.parse(File.read(path))
    records.each do |record|
        Step.create!(record)
    end
    puts "Steps are seeded"
end


if User.count == 0
    path = File.join(File.dirname(__FILE__), "./data/ListUser.json")
    records = JSON.parse(File.read(path))
    records.each do |record|
      User.create!(record)
    end
    puts "Users are seeded"
end


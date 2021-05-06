# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

CSV.foreach('db/seed_stds.csv') do |row|
  Standard.create(Category: row[0], xEnergy: row[1], xProtein: row[2], xLipid: row[3], xCarbohydrate: row[4], xDietary_fiber: row[5], xPotassium: row[6], xCalcium: row[7], xiron: row[8], xZinc: row[9], xVitaminA: row[10], xVitaminB1: row[11], xVitaminB2: row[12], xVitaminC: row[13], xSalt_equivalent: row[14])
end

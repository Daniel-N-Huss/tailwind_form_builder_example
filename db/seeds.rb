# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

9.times do
  Adventurer.create(name: Faker::Games::ElderScrolls.name, klass: Faker::Games::DnD.klass, alignment: Adventurer::GOOD_ALIGNMENTS.sample, city: Faker::Games::DnD.city, primary_weapon: Faker::Games::DnD.melee_weapon, secondary_weapon: Faker::Games::DnD.ranged_weapon, number_of_campaigns: rand(40), days_adventuring: rand(4000))
end

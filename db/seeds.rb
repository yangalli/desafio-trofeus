# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[1, 100, 1000, 10000, 100000].each do |value|
  Trophy.find_or_create_by!(trophy_category: 0, value: value)
end

[1, 100, 1000, 10000, 100000].each do |value|
  Trophy.find_or_create_by!(trophy_category: 1, value: value)
end

[1, 10, 25, 50, 100].each do |value|
  Trophy.find_or_create_by!(trophy_category: 2, value: value)
end
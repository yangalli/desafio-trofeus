# frozen_string_literal: true

# collected_coins
[1, 100, 1000, 10_000, 100_000].each do |value|
  Trophy.find_or_create_by!(trophy_category: 0, value: value)
end

# killed_monsters
[1, 100, 1000, 10_000, 100_000].each do |value|
  Trophy.find_or_create_by!(trophy_category: 1, value: value)
end

# times_of_death
[1, 10, 25, 50, 100].each do |value|
  Trophy.find_or_create_by!(trophy_category: 2, value: value)
end

# killed_turtles
[1, 100, 1000, 10_000, 100_000].each do |value|
  Trophy.find_or_create_by!(trophy_category: 3, value: value)
end

# killed_bowsers
[1, 100, 1000, 10_000, 100_000].each do |value|
  Trophy.find_or_create_by!(trophy_category: 4, value: value)
end

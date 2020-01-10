class Trophy < ApplicationRecord
  enum trophy_category: %i[collected_coins killed_monsters times_of_death]
end

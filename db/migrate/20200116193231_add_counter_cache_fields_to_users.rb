class AddCounterCacheFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :collected_coins_count, :integer, default: 0
    add_column :users, :deaths_count, :integer, default: 0
    add_column :users, :killed_monsters_count, :integer, default: 0
  end
end

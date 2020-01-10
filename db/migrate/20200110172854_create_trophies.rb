class CreateTrophies < ActiveRecord::Migration[6.0]
  def change
    create_table :trophies do |t|
      t.integer :trophy_category
      t.integer :value

      t.timestamps
    end
  end
end

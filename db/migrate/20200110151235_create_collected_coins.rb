class CreateCollectedCoins < ActiveRecord::Migration[6.0]
  def change
    create_table :collected_coins do |t|
      t.integer :value
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateTrophyUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :trophy_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trophy, null: false, foreign_key: true

      t.timestamps
    end
  end
end

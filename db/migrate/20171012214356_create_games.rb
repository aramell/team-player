class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.date :game_date
      t.time :game_time
      t.integer :team_id
      t.integer :user_id
      t.integer :sport_id
      t.integer :field_id

      t.timestamps
    end
  end
end

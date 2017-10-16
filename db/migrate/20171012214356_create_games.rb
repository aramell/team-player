class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.date :game_date
      t.time :game_time
      t.string :location
      t.integer :team_id
      t.integer :user_id
      t.integer :sport_id

      t.timestamps
    end
  end
end

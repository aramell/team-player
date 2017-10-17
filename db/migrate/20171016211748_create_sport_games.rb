class CreateSportGames < ActiveRecord::Migration[5.1]
  def change
    create_table :sport_games do |t|
      t.integer :game_id
      t.integer :sport_id
      t.timestamps
    end
  end
end

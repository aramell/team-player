class CreateSportGames < ActiveRecord::Migration[5.1]
  def change
    create_table :sport_games do |t|

      t.timestamps
    end
  end
end

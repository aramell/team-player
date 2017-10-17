class AddSportidToSportGame < ActiveRecord::Migration[5.1]
  def change
    add_column :sport_games, :sport_id, :integer
  end
end

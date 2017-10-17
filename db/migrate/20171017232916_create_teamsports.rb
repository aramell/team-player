class CreateTeamsports < ActiveRecord::Migration[5.1]
  def change
    create_table :team_sports do |t|
      t.integer :team_id
      t.integer :sport_id

      t.timestamps
    end
  end
end

class CreateSports < ActiveRecord::Migration[5.1]
  def change
    create_table :sports do |t|
      t.string :name
      t.integer :team_id
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
  end
end

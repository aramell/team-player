class CreateFields < ActiveRecord::Migration[5.1]
  def change
    create_table :fields do |t|
      t.integer :game_id
      t.integer :team_id
      t.string :name
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end

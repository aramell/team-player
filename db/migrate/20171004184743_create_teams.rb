class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.integer :user_id
      t.string :name
      t.string :positions
      t.integer :game_id
      

      t.timestamps
    end
  end
end

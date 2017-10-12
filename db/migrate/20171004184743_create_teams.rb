class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.integer :player_id
      t.string :name
      t.string :positions
      

      t.timestamps
    end
  end
end

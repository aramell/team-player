class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :player_id
      t.string :name
      t.string :positions
      

      t.timestamps
    end
  end
end

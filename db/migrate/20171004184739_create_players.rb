class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :team
      t.string :positions
      t.string :player_id

      t.timestamps
    end
  end
end

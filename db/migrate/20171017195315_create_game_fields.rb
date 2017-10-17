class CreateGameFields < ActiveRecord::Migration[5.1]
  def change
    create_table :game_fields do |t|

      t.timestamps
    end
  end
end

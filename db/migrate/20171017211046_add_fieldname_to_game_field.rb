class AddFieldnameToGameField < ActiveRecord::Migration[5.1]
  def change
    add_column :game_fields, :game_id, :integer
  end
end

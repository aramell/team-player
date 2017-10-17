class AddFieldidToGameField < ActiveRecord::Migration[5.1]
  def change
    add_column :game_fields, :field_id, :integer
  end
end

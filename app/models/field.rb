class Field < ApplicationRecord
  has_many :game_fields
  has_many :games, through: :game_fields

end

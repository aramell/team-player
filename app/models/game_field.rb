class GameField < ApplicationRecord
  belongs_to :game
  belongs_to :field
end

class Team < ApplicationRecord
  has_many :users
  has_many :games
end

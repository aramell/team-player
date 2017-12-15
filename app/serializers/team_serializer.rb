class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :positions, :game_id, :sport_id
  has_many :games
  has_many :sports
end

class TeamSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :positions, :game_id, :sport_id
  has_many :games
end

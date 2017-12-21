class TeamGameSerializer < ActiveModel::Serializer
  attributes :id, :name, :sport, :game, :game_time, :game_date
  belongs_to :team
  belongs_to :game
  belongs_to :user
end

class TeamGameSerializer < ActiveModel::Serializer
  attributes :id, :name, :sport, :game
  belongs_to :team
  belongs_to :game
  belongs_to :user
end

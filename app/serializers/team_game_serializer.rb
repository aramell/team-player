class TeamGameSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :team
  belongs_to :game
end

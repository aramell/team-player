class SportSerializer < ActiveModel::Serializer
  attributes :id, :name, :team_id, :user_id, :game_id
  
  has_many :team_sports
  has_many :teams, through: :team_sports
end

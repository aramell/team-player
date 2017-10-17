class GamesController < ApplicationController
  def index
    @games = current_user.team.games
  end
  
  def new
    # binding.pry
    @game = Game.new
    @game.fields.build
  end

  def create
    @game = current_user.games.new(game_params)
    if @game.save
      redirect_to team_path(@game.team_id)
    else
      redirect_to new_game_path
    end

  end

  def show
    # binding.pry
    @game = Game.find_by(:id => params[:id])
    
  end
  private
  def game_params
    params.require(:game).permit(:game_date, :game_time, :team_id, :sport_id, :field_ids => [], fields_attributes: [:name, :location])

  end
end

class GamesController < ApplicationController
  def index
    @games = Game.all
  end
  
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to team_path(@game.team_id)
    else
      redirect_to new_game_path
    end

  end

  def show
    @team = Team.find_by(:id => params[:id])
    
  end
  private
  def game_params
    params.require(:game).permit(:game_date, :game_time, :location, :team_id, :user_id)

  end
end

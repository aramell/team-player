class GamesController < ApplicationController
  def index
    @games = current_user.teams
  end
  
  def new
    binding.pry
    @team = Team.find_by(:id => params[:team_id])
    @game = Game.new
  end

  def create
    @game = current_user.teams.last.games.new(game_params)
    # binding.pry
    if @game.save
      redirect_to team_path(@game.team_id)
    else
      @team = Team.find_by(:id => params[:team_id])
         render 'new'
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

class GamesController < ApplicationController
  include GameHelper
  def index
    binding.pry
    Game.my_games
    @teams = current_user.teams
  end
  
  def new
    @team = Team.find_by(:id => params[:team_id])
    @game = Game.new
  end

  def create
    @game = current_user.teams.last.games.new(game_params)
    if @game.save
      redirect_to team_path(@game.team_id)
    else
      @team = Team.find_by(:id => params[:team_id])
         render 'new'
    end
  end

  def show
    set_game
    
  end
  def destroy
    set_game
    @team = Team.find_by(:id => params[:team_id])
    
    @game.destroy
    redirect_to teams_path(params[:team_id])
  end

  private
  def game_params
    params.require(:game).permit(:game_date, :game_time, :team_id, :sport_id, :field_id)

  end
  # def set_game
  #   @game = Game.find_by(:id => params[:id])
  # end
end

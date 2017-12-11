class GamesController < ApplicationController
  include GameHelper
  include TeamHelper
  def index
    @games = current_user.games
    respond_to do |f|
      f.html 
      f.json {render json: @games}
    end
    
    # @teams = current_user.teams
    # @todays_games = Game.today_games 
    # @other_games = Game.other_games
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
    set_team
    # binding.pry
    @game.destroy
    
    redirect_to root_path
  end

  private
  def game_params
    params.require(:game).permit(:game_date, :game_time, :team_id, :sport_id, :field_id)

  end
  # def set_game
  #   @game = Game.find_by(:id => params[:id])
  # end
end

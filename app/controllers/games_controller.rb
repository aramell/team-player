class GamesController < ApplicationController
  include GameHelper
  include TeamHelper
  def index
    @games = current_user.games
    @todays_games = Game.today_games 
    @other_games = Game.other_games
    @gamesall = Game.all
    
    respond_to do |f|
      # f.html 
      f.json {render json: @gamesall}
    end

    #  render :layout=> false
  end
  
  def new
    @team = Team.find_by(:id => params[:team_id])
    
    @game = Game.new
  end

  def create
    @game = current_user.teams.last.games.new(game_params)
    if @game.save
      redirect_to '/'
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

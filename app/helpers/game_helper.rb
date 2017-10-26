module GameHelper
  def set_game
    @game = Game.find_by(:id => params[:id])
  end
  def all_games
    @games = Game.all
  end
end

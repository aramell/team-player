class TeamController < ApplicationController


  def index
    @teams = Team.all

  end 
  def new
    binding.pry
    @team = Team.new

  end
  def show
    @team = Team.find_by(:id => params[:id])

  end
end

class TeamsController < ApplicationController


  def index
    @teams = Team.all

  end 
  def new
    # binding.pry
    @teams = Team.new

  end
  def create
    binding.pry

  end
  def show
    @team = Team.find_by(:id => params[:id])

  end
end

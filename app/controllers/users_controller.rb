class UsersController < ApplicationController

  def index
    @users = User.all

  end
  def new
    @user = User.new

  end

  def show
    @user = current_user
    @team = Team.new
    @teams = Team.all
  
  end

  
end

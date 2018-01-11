class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :configure_sign_up_params, if: :devise_controller?
  
  def index
    @teams = Team.new

  end
  
  
  protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :team_id, :password, :password_confirmation])
  end
end

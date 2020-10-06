class AdminsController < ApplicationController
  before_action :authenticate_admin
  layout "admin"
  
  def index
  end
  
  private
  def authenticate_admin
    authenticate_user!
    
    unless current_user.admin?
      flash[:alert] = "You are not authorised to view"
      redirect_to root_path
    end
  end
end

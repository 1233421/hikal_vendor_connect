class VendorsController < ApplicationController
  
  before_action :authenticate_vendor
  
  def index
  end

  def submit
    if session[:va].present?
      application = VendorApplication.find(session[:va])
      application.update( is_submitted_for_approval: true )
    end
  end
  
  private
  def authenticate_vendor
    authenticate_user!
    
    unless current_user.vendor?
      flash[:alert] = "You are not authorised to view"
      redirect_to root_path
    end
  end
  
end
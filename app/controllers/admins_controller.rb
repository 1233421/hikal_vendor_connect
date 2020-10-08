class AdminsController < ApplicationController
  before_action :authenticate_admin
  layout "admin"
  
  def index
    @applications = VendorApplication.joins(:user).select("vendor_applications.id, vendor_applications.updated_at, users.first_name, users.last_name").where("is_submitted_for_approval = ? and is_approved_by_second_level = ?", true, false)
  end
  
  def view_approval
    @vendor_application = VendorApplication.includes(:general_information, :company_information, :management_information, :gst_info, :statutory_detail, :bank_detail).where(id: params[:id]).first
  end
  
  def reject
    @vendor_application = VendorApplication.where(id: params[:id]).first
    @vendor_application.rejections.create(reason: params[:reason])
    @vendor_application.update({
      is_submitted_for_approval: false,
      is_approved_by_first_level: false
    })
  end

  def approve
    @vendor_application = VendorApplication.where(id: params[:id]).first
    @vendor_application.update({
      is_approved_by_second_level: true
    })
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

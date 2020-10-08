class EmployeesController < ApplicationController
  layout "employees"
  before_action :authenticate_employee
  
  def index
    @applications = VendorApplication.joins(:user).select("vendor_applications.id, vendor_applications.updated_at, users.first_name, users.last_name").where("is_submitted_for_approval = ? and is_approved_by_first_level = ?", true, false)
  end
  
  def view_approval
    @vendor_application = VendorApplication.includes(:general_information, :company_information, :management_information, :gst_info, :statutory_detail, :bank_detail).where(id: params[:id]).first
  end
  
  def create_vendor
    user = User.new(vendor_params)
    user.password = "default@123"
    user.password_confirmation = "default@123"
    if user.save
      user.send_invite_to_user
      redirect_to employees_invite_path
    else
      redirect_to employees_invite_path, error: user.errors.full_messages.concat(", ")
    end
  end

  def reject
    @vendor_application = VendorApplication.where(id: params[:id]).first
    @vendor_application.rejections.create(reason: params[:reason])
    @vendor_application.update({
      is_submitted_for_approval: false
    })
  end

  def approve
    @vendor_application = VendorApplication.where(id: params[:id]).first
    @vendor_application.update({
      is_approved_by_first_level: true
    })
  end
  
  private
  
  def vendor_params
    params.require(:user).permit(:email, :first_name, :last_name, :role, :division, :site_name)
  end
  
  def authenticate_employee
    authenticate_user!
    
    unless current_user.employee? || current_user.admin?
      flash[:alert] = "You are not authorised to view"
      redirect_to "/vendors"
    end
  end
end
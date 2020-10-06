class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :employee_number, :department, :division, :role, :employee_position, :vendor_name, :site_name])
  end
  
  def after_sign_in_path_for(resource)
    if resource.employee?
      employees_path
    elsif resource.vendor?
      vendors_path
    else resource.admin?
      admins_path
    end
  end
  
end

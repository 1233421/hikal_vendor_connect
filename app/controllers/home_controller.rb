class HomeController < ApplicationController
  
  def index
    if user_signed_in?
      return redirect_to(vendors_path) if current_user.vendor?
      return redirect_to(employees_path) if current_user.employee?
    end
  end

end
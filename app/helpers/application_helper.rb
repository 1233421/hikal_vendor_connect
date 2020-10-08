module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def past_step_class(step_name)
  	past_step?(step_name) ? 'wizard-step-active' : ''
  end

  def current_step_class(step_name)
  	step == step_name ? 'wizard-step-info' : ''
  end
end

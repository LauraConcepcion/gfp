class ApplicationController < ActionController::Base
  #load_and_authorize_resource
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = nil
    render :file => "#{Rails.root}/public/403.html", :status => 403
  end

  def current_ability
    @current_ability ||= Ability.new(current_teacher)
  end

end

class ApplicationController < ActionController::Base
  #load_and_authorize_resource
 # add_breadcrumb :index, :root_path
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = t(:access_denied)
    redirect_to '/'
  end

  def current_ability
    @current_ability ||= Ability.new(current_teacher)
  end

end

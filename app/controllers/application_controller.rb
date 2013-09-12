class ApplicationController < ActionController::Base
  # add_breadcrumb :index, :root_path
  protect_from_forgery
  before_filter :check_profiles

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = t(:access_denied)
    redirect_to '/'
  end

  def current_ability
    @current_ability ||= Ability.new(current_teacher)
  end

  private

  def check_profiles
    return true if !current_teacher || (controller_name == 'sessions' && (action_name == 'new' || action_name == 'destroy'))

    if current_teacher.profiles.empty?
      return true if params[:controller] == 'profiles'
      flash[:alert] = t(:no_profiles_found, :scope => 'flash.general')
      redirect_to profiles_path
      false
    elsif params[:profile_id] || params[:controller] == 'profiles' && params[:id]
      profile = Profile.find(params[:profile_id] || params[:id]) # FIXME Revisar esta condición
      current_teacher.change_current_profile(profile) unless current_teacher.current_profile == profile
    elsif !current_teacher.current_profile
      flash[:notice] = t(:no_current_profile, :scope => 'flash.general')
      false
    end
  end

end

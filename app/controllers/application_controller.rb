class ApplicationController < ActionController::Base
  helper_method :profile_completed?

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_profile

  protected

  def check_profile
    return unless user_signed_in?
    redirect_to new_talent_profile_path unless profile_completed?
  end

  def profile_completed?
    current_user.talent_profile.present? || current_user.director_profile.present?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :role) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
end

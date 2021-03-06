class ApplicationController < ActionController::Base

  protect_from_forgery
  include SessionsHelper

#  before_filter :require_user
  helper_method :current_user

  private

  def current_user=(user)
    session[:user_id] = user.try(:id)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

#  def require_user
#    unless current_user
#      store_location
##      redirect_to login_path, :alert => "Please login to continue."
#      return false
#    end
#  end

#  def store_location
#    session[:return_to] = request.request_uri
#  end
#
#  def redirect_back_or_default(default)
#    redirect_to session[:return_to] || default
#    session[:return_to] = nil
#  end
  
end

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  private
  
  def current_user_session
    return @current_user if defined?(@current_user_sessiom)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = @current_user_session && @current_user_session.record
  end
  
  def login_required
    unless current_user_session
      flash[:error] = "Please login"
      redirect_to login_url 
    end
  end
  
  def role_required(role)
    unless current_user.has_role?(role.to_s)
      flash[:error] = "You do not have permission to access that resource."
      redirect_to root_url
    end
  end
end

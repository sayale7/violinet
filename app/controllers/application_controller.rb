# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  before_filter :set_locale
  before_filter :mailer_set_url_options
  before_filter :set_default_url_for_mails
  filter_parameter_logging :password, :password_confirmation
  
  rescue_from 'Acl9::AccessDenied', :with => :access_denied
  
  helper :all
  helper_method :current_user_session, :current_user
  
  def set_locale
    # if this is nil then I18n.default_locale will be used
    if request.subdomains.first == "network"
      I18n.locale = "de"
    else
      I18n.locale = request.subdomains.first
    end
  end
  
  def set_default_url_for_mails
    if request.subdomains.first != nil
      ActionMailer::Base.default_url_options[:host] = request.subdomains.first + ".network.violination.com"
    end
  end
  
  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
  
  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
#  def require_user
#    unless current_user
#      store_location
#      flash[:notice] = "You must be logged in to access this page"
#      redirect_to new_user_session_url
#      return false
#    end
#  end
#  
 def require_no_user
   if current_user
     store_location
     flash[:notice] = "You must be logged out to access this page"
     redirect_to account_url
     return false
   end
 end
#  
 def store_location
   session[:return_to] = request.request_uri
 end
#  
#  def redirect_back_or_default(default)
#    redirect_to(session[:return_to] || default)
#    session[:return_to] = nil
#  end
#  
 def access_denied
   if current_user
     flash[:notice] = 'Access denied.'
     redirect_to account_url
   else
     flash[:notice] = 'Access denied. Try to log in first.'
     redirect_to root_url
   end
 end    
  
  
  
end

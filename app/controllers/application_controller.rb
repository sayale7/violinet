# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  before_filter :set_locale
  before_filter :mailer_set_url_options
  before_filter :set_default_url_for_mails
  filter_parameter_logging :password, :password_confirmation
  
  helper :all
  helper_method :current_user_session, :current_user, :get_locale
  
  def set_locale
    # if this is nil then I18n.default_locale will be used
    if request.url.to_s.include?('www.')
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
  
  def get_locale
    return I18n.locale
  end
  
  def is_admin?
    @admin = false
    if current_user
      current_user.roles.each do |role|
        if role.name.to_s.eql?('admin')
          @admin = true
        end
      end
    end
  end
  
  def root_tags(name)
    tags = Array.new
    Tag.find_all_by_taggable_type(name).each do |tag|
      if tag.parents.empty?
        tags.push(tag)
      end
    end
    return tags
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = t('common.access_denied')
    redirect_to root_url
  end

  # rescue_from ActiveRecord::RecordNotFound do |exception|
  #   flash[:error] = t('common.record_not_found')
  #   redirect_to root_url
  # end
  
  

 def require_no_user
   if current_user
     store_location
     flash[:notice] = "You must be logged out to access this page"
     redirect_to account_url
     return false
   end
 end

 def store_location
   session[:return_to] = request.request_uri
 end

  
  
  
end

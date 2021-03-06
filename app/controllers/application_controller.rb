# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "store"
  before_filter :authorize, :except => :login
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
#  before_filter :set_locale


  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "PLease login"
      session[:original_url] = request.request_uri
      redirect_to :controller => :admin, :action => :login
    end
  end
end

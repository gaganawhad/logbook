# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def initialize
    if params # params should not be nil for it to work. else it will give errors
      @extended_order = params[:order] 
      @extended_order = @extended_order + params[:direction] if params[:direction]
      @token = params[:token]
      @prev_order = params[:order]
      @direction = params[:direction]
    end
  end

end

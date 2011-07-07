# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout "aplication"


  def login
    if request.post?
      user = Designer.authorize(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        flash[:notice] = "Hello #{user.name}"
        redirect_to request.referer
      else
        flash[:notice] = "Bad password/user"
        redirect_to request.referer
      end
    end
  end

  def logout
    if request.post?
      session[:user_id] = nil
      flash[:notice] = "Logout"
      redirect_to request.referer
    end
  end


end

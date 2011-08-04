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
        redirect_to request.referer ? :back : "/designer"
      else
        flash[:notice] = "Bad password/user"
        redirect_to request.referer ? :back : "/designer"
      end
    end
  end

  def logout
    if request.post?
      session[:user_id] = nil
      flash[:notice] = "Logout"
      redirect_to(:controller => "designer", :action => "index")
    end
  end

protected

  def authorization
    if session[:user_id].nil?
      flash[:notice] = "You have to been logged"
      redirect_to(:controller => "designer")
    end
  end

end

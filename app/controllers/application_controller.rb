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
      redirect_to designers_path
    end
  end

  def set_news
    if request.post?
      if params[:set_news][:news] == "projects"
        session[:news] = Project.find(:all, :order => "created_at desc")
      else
        session[:news] = Designer.find(:all, :order => "created_at desc")
      end

      respond_to do |format|
        format.html { redirect_to :back }
        format.js {render "helpers/set_news" }
      end
    end
  end

protected

  def authorization
    if session[:user_id].nil?
      flash[:notice] = "You have to been logged"
      redirect_to designers_path
    end
  end
end

class ProjectController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    project = Project.new(:portfolio_id => Designer.find(session[:user_id]).portfolio.id,
                          :text         => params[:text],
                          :link         => params[:link],
                          :image_url    => params[:image_url])

    if project.save
      flash[:notice] = "project add"
      redirect_to :controller => "portfolio"
    else
      render :action => "new"
    end
  end
end

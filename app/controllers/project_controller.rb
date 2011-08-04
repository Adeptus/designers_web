class ProjectController < ApplicationController
  before_filter :authorization, :except => [:show, :login]

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
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

class ProjectsController < ApplicationController
  before_filter :authorization, :except => [:index, :show, :login, :set_news]

  def index
    @projects = Project.search(params[:search], params[:page], params[:order])
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to :action => 'index'
  end

  def create
    project = Project.new(:portfolio_id => Designer.find(session[:user_id]).portfolio.id,
                          :text         => params[:text],
                          :link         => params[:link],
                          :image_url    => params[:image_url])

    if project.save
      flash[:notice] = "project add"
      redirect_to project_path(project)
    else
      render :action => "new"
    end
  end
end

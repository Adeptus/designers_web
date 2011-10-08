class ProjectsController < ApplicationController
  before_filter :authorization, :except => [:index, :show, :login, :set_news]
  helper_method :sort_column, :sort_direction

  def index
    @projects = Project.search(params[:search], params[:page], sort_column, sort_direction)
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

private

  def sort_column
    Project.column_names.include?(params[:order]) ? params[:order] : "text"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end

class RatingsController < ApplicationController
  before_filter :get_project
  after_filter  :update_designer_score

  def create
    @rating = Rating.new(params[:rating])
    @rating.project_id = @project.id
    @rating.designer_id = session[:user_id]
    @rating.save

    respond_to do |format|
      format.html { redirect_to :controller => "project", 
                                :action => "show", 
                                :id => @project.id }
      format.js
    end
  end

  def update
    @rating = Designer.find(session[:user_id]).ratings.find_by_project_id(@project.id)
    @rating.update_attributes(params[:rating])

    respond_to do |format|
      format.html { redirect_to :controller => "project", 
                                :action => "show", 
                                :id => @project.id }
      format.js
    end
  end

private

  def get_project
    @project = Project.find(params[:project_id])
  end

  def update_designer_score
    Designer.find(@project.portfolio.designer_id).update_score
  end
end

class PortfolioController < ApplicationController

  def index
    @designer  = Designer.find(params[:id])

    if @designer.nil?
    redirect_to(:controller => "designer",
                 :notice => "Designer with #{params[:id]} doesn't exist")
    end
  end

  def add_project

  end
end

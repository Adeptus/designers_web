class PortfolioController < ApplicationController
  before_filter :authorization, :except => [:index, :login]

  def index
    @designers  = Designer.find(:all)
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Select correct designer"
    redirect_to(:controller => "designer")
  end

  def new
    @portfolio = Portfolio.new
    if !Designer.find(session[:user_id]).portfolio.nil?
      redirect_to_index("you have portfolio")
    end
  end

  def create
    portfolio = Portfolio.new(:designer_id => session[:user_id],
                              :text        => params[:portfolio])

    if portfolio.save
      redirect_to_index("portfolio creaded")
    else
      render :action => "new"
    end
  end

private

  def redirect_to_index(message = nil)
    flash[:notice] = message
    redirect_to :action => 'index'
  end

  def authorization
    if session[:user_id].nil?
      flash[:notice] = "You have to been logged"
      redirect_to(:controller => "designer")
    end
  end
end

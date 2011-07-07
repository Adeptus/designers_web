class DesignerController < ApplicationController

  def index
    @designers = Designer.find(:all)
  end

  def new
    @designer = Designer.new
  end

  def create
    @designer = Designer.new(params[:designer])

    if @designer.save
      redirect_to_index("aded new designer")
    else
      render :action => "new"
    end
  end

  def edit

  end

  def update

  end

  def destroy
    Designer.find(params[:id]).destroy
    session[:user_id] = nil
    redirect_to_index("delete designer")
  end

private

  def redirect_to_index(message = nil)
    flash[:notice] = message
    redirect_to :action => 'index'
  end
end

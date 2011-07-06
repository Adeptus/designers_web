class DesignerController < ApplicationController

  def index
    @designers = Designer.find(:all)
  end

  def add
    @designer = Designer.new
  end

  def create
    @designer = Designer.new(params[:designer])

    if @designer.save
      redirect_to_index("aded new designer")
    else
      render :action => "add"
    end
  end

  def destroy
    @designer = Designer.find(params[:id])
    @designer.destroy
    redirect_to_index("delete designer")
  end

  def login
    if request.post?
      user = Designer.authorize(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to_index("Hello #{user.name}")        
      else
        redirect_to_index("Bad password/user")        
      end
    end
  end

  def logout
    if request.post?
      session[:user_id] = nil
      redirect_to_index("Logout")
    end
  end

private

  def redirect_to_index(message = nil)
    flash[:notice] = message
    redirect_to :action => 'index'
  end
end

class CommentController < ApplicationController
  before_filter :authorization

  def create
    @comment = Comment.create!(:text            => params[:add_comment][:text],
                               :designer_id     => session[:user_id],
                               :attachable_id   => params[:add_comment][:attachable_id],
                               :attachable_type => params[:add_comment][:attachable_type],)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end


  def destroy
    @comment = Comment.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end


end

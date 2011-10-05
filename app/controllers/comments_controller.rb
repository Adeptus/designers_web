class CommentsController < ApplicationController
#  before_filter :authorization

  def create
    @comment = Comment.new(params[:add_comment])

    @comment.save
    respond_to do |format|
      format.html { redirect_to request.referer ? :back : "/projects" }
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to request.referer ? :back : "/projects" }
      format.js
    end
  end
end

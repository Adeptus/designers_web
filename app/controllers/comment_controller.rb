class CommentController < ApplicationController

  def create
    comment = Comment.new(:text            => params[:text],
                          :designer_id     => session[:user_id],
                          :attachable_id   => params[:attachable_id],
                          :attachable_type => params[:attachable_type],)

    if comment.save
      redirect_to :back #request.referer
    else
      flash[:notice] = "error comment"
      render :back
    end
  end

end

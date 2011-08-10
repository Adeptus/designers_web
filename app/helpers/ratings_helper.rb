module RatingsHelper

  def current_designer_rating
    if @rating = Designer.find(session[:user_id]).ratings.find_by_project_id(@project.id)
        @rating.value
    else
        "N/A"
    end
  end
end

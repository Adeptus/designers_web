module ProjectHelper

  def project_sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:order => column, :direction => direction, :page => nil), {:class => css_class}
  end

  def check_score
    "stars" + Project.find_by_id(params[:id]).average_rating.to_i.to_s
  end

  def check_vote_before
    if @project.ratings.find_by_designer_id(session[:user_id])
      "update"
    else
      "create"
    end
  end

  def star_link(star_number, action)
    method = check_action(action)
    link_to_remote star_number, {
                                 :url => 
                                    {
                                      :controller => "ratings",
                                      :action     => action,
                                      :project_id => params[:id],
                                      :value      => star_number
                                    },
                                 :method => method
                                 }
  end

private

  def check_action(action)
    if action == "create"
      "POST"
    else
      "PUT"
    end
  end

end

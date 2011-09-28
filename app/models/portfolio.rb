class Portfolio < ActiveRecord::Base
  belongs_to :designer
  has_many   :projects
  has_many   :comments, :as => :attachable

  def get_average_portfolio_ratings
    out_arr = []
    self.projects.each do |project|
      out_arr << project.average_rating if project.average_rating != "NaN" 
    end
    return 0.0 if out_arr.empty?
    (out_arr.sum / out_arr.count).round(2)
  end
end

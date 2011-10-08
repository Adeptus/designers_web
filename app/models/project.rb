class Project < ActiveRecord::Base
  belongs_to :portfolio
  has_many   :comments, :as => :attachable
  has_many   :ratings
  has_many   :raters, :through => :ratings, :source => :designers

  def self.search(search, page, order, direction)
    paginate :per_page => 5, :page => page,
             :conditions => ['text like ?', "%#{search}%"],
             :order => order + " " + direction
  end

  def update_score
    self.update_attributes(:score => average_rating)
  end

  def average_rating
      value = self.ratings.inject(0) do |value, rating|
          value += rating.value
      end
      return "NaN" if value == 0
      value.to_f / self.ratings.size.to_f
  end
end

class Project < ActiveRecord::Base
  belongs_to :portfolio
  has_many   :comments, :as => :attachable
  has_many   :ratings
  has_many   :raters, :through => :ratings, :source => :designers


  def average_rating
      value = self.ratings.inject(0) do |value, rating|
          value += rating.value
      end
      return "NaN" if value == 0
      value.to_f / self.ratings.size.to_f
  end
end

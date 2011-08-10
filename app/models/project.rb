class Project < ActiveRecord::Base
  belongs_to :portfolio
  has_many   :comments, :as => :attachable
  has_many :ratings
  has_many :raters, :through => :ratings, :source => :designers


  def average_rating
      @value = 0
      self.ratings.each do |rating|
          @value = @value + rating.value
      end
      @total = self.ratings.size
      @value.to_f / @total.to_f
  end
end

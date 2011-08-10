class Designer < ActiveRecord::Base
  has_one  :portfolio
  has_many :comments
  has_many :ratings
  has_many :rated_projects, :through => :ratings, :source => :photos
  validates_presence_of     :name, :password, :tel, :image_url, :presentation
  validates_numericality_of :tel
  validates_uniqueness_of   :name, :message => "designer already exist"

  def self.authorize(name, password)
    user = find_by_name_and_password(name, password)    
    return user || nil
  end

end


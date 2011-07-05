class Designer < ActiveRecord::Base

  validates_presence_of     :name, :tel, :image_url, :presentation
  validates_numericality_of :tel
  validates_uniqueness_of   :name, :message => "designer already exist"

end

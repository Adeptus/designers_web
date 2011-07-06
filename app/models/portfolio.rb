class Portfolio < ActiveRecord::Base
  belongs_to :designer
  has_many   :projects

  validates_presence_of     :designer_id
  validates_numericality_of :designer_id
  validates_uniqueness_of   :designer_id
end

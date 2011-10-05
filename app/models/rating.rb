class Rating < ActiveRecord::Base
  attr_accessible :value

  belongs_to :designer
  belongs_to :project

  validates_presence_of :value, :project_id, :designer_id

end

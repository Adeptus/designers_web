class Rating < ActiveRecord::Base
  attr_accessible :value

  belongs_to :designer
  belongs_to :project
end
